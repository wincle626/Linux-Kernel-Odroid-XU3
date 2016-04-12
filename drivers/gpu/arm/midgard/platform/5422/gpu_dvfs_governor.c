/* drivers/gpu/t6xx/kbase/src/platform/gpu_dvfs_governor.c
 *
 * Copyright 2011 by S.LSI. Samsung Electronics Inc.
 * San#24, Nongseo-Dong, Giheung-Gu, Yongin, Korea
 *
 * Samsung SoC Mali-T604 DVFS driver
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software FoundatIon.
 */

/**
 * @file gpu_dvfs_governor.c
 * DVFS
 */

#include <mali_kbase.h>

#include <linux/io.h>
#include <linux/pm_qos.h>
#include <mach/asv-exynos.h>

//added by yunwu 2016.04.05
#include "gpu_custom_interface.h"

#include "mali_kbase_platform.h"
#include "mali_kbase_config_platform.h"
#include "gpu_dvfs_handler.h"
#include "gpu_dvfs_governor.h"
#include "gpu_control.h"
#ifdef CONFIG_CPU_THERMAL_IPA
#include "gpu_ipa.h"
#endif /* CONFIG_CPU_THERMAL_IPA */

#ifdef CONFIG_MALI_MIDGARD_DVFS
typedef void (*GET_NEXT_FREQ)(struct kbase_device *kbdev, int utilization);
GET_NEXT_FREQ gpu_dvfs_get_next_freq;

static char *governor_list[G3D_MAX_GOVERNOR_NUM] = {"Default", "Static", "Booster" , "Userspace_yw"/*added by yunwu 2016.04.06*/};
#endif /* CONFIG_MALI_MIDGARD_DVFS */

#define GPU_DVFS_TABLE_SIZE(X)  ARRAY_SIZE(X)
#define CPU_MAX PM_QOS_CPU_FREQ_MAX_DEFAULT_VALUE

static gpu_dvfs_info gpu_dvfs_infotbl_default[] = {
/*  vol,clk,min,max,down stay, pm_qos mem, pm_qos int, pm_qos cpu_kfc_min, pm_qos cpu_egl_max */
	{812500,  177,  0,   3, 2, 0, 275000, 222000,       0, CPU_MAX},
	{862500,  266,  4,   6, 1, 0, 413000, 222000,       0, CPU_MAX},
	{912500,  350,  7,  10, 1, 0, 728000, 333000,       0, CPU_MAX},
	{962500,  420, 11,  14, 1, 0, 825000, 400000,       0, CPU_MAX},
	{1000000, 480, 15,  20, 1, 0, 825000, 400000, 1000000, CPU_MAX},
	{1037500, 543, 21,  25, 1, 0, 825000, 400000, 1000000, CPU_MAX},
	{1150000, 600, 26, 100, 1, 0, 825000, 413000, 1500000, CPU_MAX},
};


#ifdef CONFIG_DYNIMIC_ABB
static int gpu_abb_infobl_default[] = {900000, 900000, 950000, 1000000, 1075000, 1175000};
#endif 

#ifdef CONFIG_MALI_MIDGARD_DVFS
static int gpu_dvfs_governor_default(struct kbase_device *kbdev, int utilization)
{
	struct exynos_context *platform;
	/* HACK: On Linux es2gears and glmark2-es2 doesn't utilize 100% 
	 * of the GPU. So we need to keep it on the high frequency to get 
	 * proper performance. */
	utilization = 100;

	platform = (struct exynos_context *) kbdev->platform_context;
	if (!platform)
		return -ENODEV;

	if ((platform->step < platform->table_size-1) &&
			(utilization > platform->table[platform->step].max_threshold)) {
		platform->step++;
		platform->down_requirement = platform->table[platform->step].stay_count;
		DVFS_ASSERT(platform->step < platform->table_size);
	} else if ((platform->step > 0) && (utilization < platform->table[platform->step].min_threshold)) {
		DVFS_ASSERT(platform->step > 0);
		platform->down_requirement--;
		if (platform->down_requirement == 0) {
			platform->step--;
			platform->down_requirement = platform->table[platform->step].stay_count;
		}
	} else {
		platform->down_requirement = platform->table[platform->step].stay_count;
	}

	return 0;
}

static int gpu_dvfs_governor_static(struct kbase_device *kbdev, int utilization)
{
	struct exynos_context *platform;
	static bool increase = true;
	static int count;

	platform = (struct exynos_context *) kbdev->platform_context;
	if (!platform)
		return -ENODEV;

	if (count == G3D_GOVERNOR_STATIC_PERIOD) {
		if (increase) {
			if (platform->step < platform->table_size-1)
				platform->step++;
			if (((platform->max_lock > 0) && (platform->table[platform->step].clock == platform->max_lock))
					|| (platform->step == platform->table_size-1))
				increase = false;
		} else {
			if (platform->step > 0)
				platform->step--;
			if (((platform->min_lock > 0) && (platform->table[platform->step].clock == platform->min_lock))
					|| (platform->step == 0))
				increase = true;
		}

		count = 0;
	} else {
		count++;
	}

	return 0;
}

static int gpu_dvfs_governor_booster(struct kbase_device *kbdev, int utilization)
{
	struct exynos_context *platform;
	static int weight;
	int cur_weight, booster_threshold, dvfs_table_lock, i;

	platform = (struct exynos_context *) kbdev->platform_context;
	if (!platform)
		return -ENODEV;

	cur_weight = platform->cur_clock*utilization;
	/* booster_threshold = current clock * set the percentage of utilization */
	booster_threshold = platform->cur_clock * 50;

	dvfs_table_lock = platform->table_size-1;
	for (i = platform->table_size-1; i >= 0; i--)
		if (platform->table[i].max_threshold == 100)
			dvfs_table_lock = i;

	if ((platform->step < dvfs_table_lock-2) &&
			((cur_weight - weight) > booster_threshold)) {
		platform->step += 2;
		platform->down_requirement = platform->table[platform->step].stay_count;
		GPU_LOG(DVFS_WARNING, "[G3D_booster] increase G3D level 2 step\n");
		DVFS_ASSERT(platform->step < platform->table_size);
	} else if ((platform->step < platform->table_size-1) &&
			(utilization > platform->table[platform->step].max_threshold)) {
		platform->step++;
		platform->down_requirement = platform->table[platform->step].stay_count;
		DVFS_ASSERT(platform->step < platform->table_size);
	} else if ((platform->step > 0) && (utilization < platform->table[platform->step].min_threshold)) {
		DVFS_ASSERT(platform->step > 0);
		platform->down_requirement--;
		if (platform->down_requirement == 0) {
			platform->step--;
			platform->down_requirement = platform->table[platform->step].stay_count;
		}
	} else {
		platform->down_requirement = platform->table[platform->step].stay_count;
	}
	weight = cur_weight;

	return 0;
}

static int gpu_dvfs_governor_userspace_yw(struct kbase_device *kbdev, int utilization)
{
	/*struct exynos_context *platform;
	static bool increase = true;
	static int count;

	platform = (struct exynos_context *) kbdev->platform_context;
	if (!platform)
		return -ENODEV;

	if (count == G3D_GOVERNOR_STATIC_PERIOD) {
		if (increase) {
			if (platform->step < platform->table_size-1)
				platform->step++;
			if (((platform->max_lock > 0) && (platform->table[platform->step].clock == platform->max_lock))
					|| (platform->step == platform->table_size-1))
				increase = false;
		} else {
			if (platform->step > 0)
				platform->step--;
			if (((platform->min_lock > 0) && (platform->table[platform->step].clock == platform->min_lock))
					|| (platform->step == 0))
				increase = true;
		}

		count = 0;
	} else {
		count++;
	}*/
	struct exynos_context *platform;
	platform = (struct exynos_context *) kbdev->platform_context;
	if (platform->step >= 0 && platform->step < platform->table_size-1){
		//platform->step = platform->step;
	}else if(platform->step < 0){
		platform->step = 0;
	}else if(platform->step > platform->table_size-1){
		platform->step = platform->table_size-1;
	}else{
		platform->step = platform->table_size-1;
	}

	return 0;
}
#endif /* CONFIG_MALI_MIDGARD_DVFS */

static int gpu_dvfs_update_asv_table(struct exynos_context *platform, int governor_type)
{
	int i, voltage;
#ifdef CONFIG_DYNIMIC_ABB
	unsigned int asv_abb = 0;
	for (i = 0; i < platform->table_size; i++) {
		asv_abb = get_match_abb(ID_G3D, platform->table[i].clock*1000);
		if (!asv_abb) {
			platform->devfreq_g3d_asv_abb[i] = ABB_BYPASS;
		} else {
			platform->devfreq_g3d_asv_abb[i] = asv_abb;
		}
		GPU_LOG(DVFS_INFO, "DEVFREQ(G3D) : %uKhz, ABB %u\n", platform->table[i].clock*1000, platform->devfreq_g3d_asv_abb[i]);
#else
	for (i = 0; i < platform->table_size; i++) {
#endif
		voltage = get_match_volt(ID_G3D, platform->table[i].clock*1000);
		if (voltage > 0)
			platform->table[i].voltage = voltage;
		GPU_LOG(DVFS_INFO, "G3D %dKhz ASV is %duV\n", platform->table[i].clock*1000, platform->table[i].voltage);
	}
	return 0;
}

int gpu_dvfs_governor_init(struct kbase_device *kbdev, int governor_type)
{
	unsigned long flags;
#ifdef CONFIG_MALI_MIDGARD_DVFS
	int i, total = 0;
#endif /* CONFIG_MALI_MIDGARD_DVFS */
	struct exynos_context *platform = (struct exynos_context *) kbdev->platform_context;
	if (!platform)
		return -ENODEV;

	spin_lock_irqsave(&platform->gpu_dvfs_spinlock, flags);

#ifdef CONFIG_MALI_MIDGARD_DVFS
	switch (governor_type) {
	case G3D_DVFS_GOVERNOR_DEFAULT:
		gpu_dvfs_get_next_freq = (GET_NEXT_FREQ)&gpu_dvfs_governor_default;
		platform->table = gpu_dvfs_infotbl_default;
		platform->table_size = GPU_DVFS_TABLE_SIZE(gpu_dvfs_infotbl_default);
#ifdef CONFIG_DYNIMIC_ABB
		platform->devfreq_g3d_asv_abb = gpu_abb_infobl_default;
#endif
		platform->step = gpu_dvfs_get_level(platform, G3D_GOVERNOR_DEFAULT_CLOCK_DEFAULT);
		break;
	case G3D_DVFS_GOVERNOR_STATIC:
		gpu_dvfs_get_next_freq = (GET_NEXT_FREQ)&gpu_dvfs_governor_static;
		platform->table = gpu_dvfs_infotbl_default;
		platform->table_size = GPU_DVFS_TABLE_SIZE(gpu_dvfs_infotbl_default);
#ifdef CONFIG_DYNIMIC_ABB
		platform->devfreq_g3d_asv_abb = gpu_abb_infobl_default;
#endif
		platform->step = gpu_dvfs_get_level(platform, G3D_GOVERNOR_DEFAULT_CLOCK_STATIC);
		break;
	case G3D_DVFS_GOVERNOR_BOOSTER:
		gpu_dvfs_get_next_freq = (GET_NEXT_FREQ)&gpu_dvfs_governor_booster;
		platform->table = gpu_dvfs_infotbl_default;
		platform->table_size = GPU_DVFS_TABLE_SIZE(gpu_dvfs_infotbl_default);
#ifdef CONFIG_DYNIMIC_ABB
		platform->devfreq_g3d_asv_abb = gpu_abb_infobl_default;
#endif
		platform->step = gpu_dvfs_get_level(platform, G3D_GOVERNOR_DEFAULT_CLOCK_BOOSTER);
		break;
	case G3D_DVFS_GOVERNOR_USERSPACE_YW:// added by yunwu 2016.04.06
		gpu_dvfs_get_next_freq = (GET_NEXT_FREQ)&gpu_dvfs_governor_userspace_yw;
		platform->table = gpu_dvfs_infotbl_default;
		platform->table_size = GPU_DVFS_TABLE_SIZE(gpu_dvfs_infotbl_default);
#ifdef CONFIG_DYNIMIC_ABB
		platform->devfreq_g3d_asv_abb = gpu_abb_infobl_default;
#endif
		platform->step = gpu_dvfs_get_level(platform, G3D_GOVERNOR_DEFAULT_CLOCK_USERSPACE_YW);
		break;
	default:
		GPU_LOG(DVFS_WARNING, "[gpu_dvfs_governor_init] invalid governor type\n");
		gpu_dvfs_get_next_freq = (GET_NEXT_FREQ)&gpu_dvfs_governor_default;
		platform->table = gpu_dvfs_infotbl_default;
		platform->table_size = GPU_DVFS_TABLE_SIZE(gpu_dvfs_infotbl_default);
#ifdef CONFIG_DYNIMIC_ABB
		platform->devfreq_g3d_asv_abb = gpu_abb_infobl_default;
#endif
		platform->step = gpu_dvfs_get_level(platform, G3D_GOVERNOR_DEFAULT_CLOCK_DEFAULT);
		break;
	}

	platform->utilization = 100;
	platform->target_lock_type = -1;
	platform->max_lock = 0;
	platform->min_lock = 0;
#ifdef CONFIG_CPU_THERMAL_IPA
	gpu_ipa_dvfs_calc_norm_utilisation(kbdev);
#endif /* CONFIG_CPU_THERMAL_IPA */
	for (i = 0; i < NUMBER_LOCK; i++) {
		platform->user_max_lock[i] = 0;
		platform->user_min_lock[i] = 0;
	}

	platform->down_requirement = 1;
	platform->wakeup_lock = 0;

	platform->governor_type = governor_type;
	platform->governor_num = G3D_MAX_GOVERNOR_NUM;

	for (i = 0; i < G3D_MAX_GOVERNOR_NUM; i++)
		total += snprintf(platform->governor_list+total,
			sizeof(platform->governor_list), "[%d] %s\n", i, governor_list[i]);

	gpu_dvfs_init_time_in_state(platform);
#else
	platform->table = gpu_dvfs_infotbl_default;
	platform->table_size = GPU_DVFS_TABLE_SIZE(gpu_dvfs_infotbl_default);
#ifdef CONFIG_DYNIMIC_ABB
	platform->devfreq_g3d_asv_abb = gpu_abb_infobl_default;
#endif /* SOC_NAME */
	platform->step = gpu_dvfs_get_level(platform, MALI_DVFS_START_FREQ);
#endif /* CONFIG_MALI_MIDGARD_DVFS */

	platform->cur_clock = platform->table[platform->step].clock;

	/* asv info update */
	gpu_dvfs_update_asv_table(platform, governor_type);

	spin_unlock_irqrestore(&platform->gpu_dvfs_spinlock, flags);

	return 1;
}

#ifdef CONFIG_MALI_MIDGARD_DVFS
int gpu_dvfs_init_time_in_state(struct exynos_context *platform)
{
#ifdef CONFIG_MALI_MIDGARD_DEBUG_SYS
	int i;

	for (i = 0; i < platform->table_size; i++)
		platform->table[i].time = 0;
#endif /* CONFIG_MALI_MIDGARD_DEBUG_SYS */

	return 0;
}

int gpu_dvfs_update_time_in_state(struct exynos_context *platform, int freq)
{
#ifdef CONFIG_MALI_MIDGARD_DEBUG_SYS
	u64 current_time;
	static u64 prev_time;
	int level = gpu_dvfs_get_level(platform, freq);

	if (prev_time == 0)
		prev_time = get_jiffies_64();

	current_time = get_jiffies_64();
	if ((level >= 0) && (level < platform->table_size))
		platform->table[level].time += current_time-prev_time;

	prev_time = current_time;
#endif /* CONFIG_MALI_MIDGARD_DEBUG_SYS */

	return 0;
}

int gpu_dvfs_decide_next_level(struct kbase_device *kbdev, int utilization)
{
	unsigned long flags;
	struct exynos_context *platform = (struct exynos_context *) kbdev->platform_context;
	if (!platform)
		return -ENODEV;

	spin_lock_irqsave(&platform->gpu_dvfs_spinlock, flags);
	gpu_dvfs_get_next_freq(kbdev, utilization);
	spin_unlock_irqrestore(&platform->gpu_dvfs_spinlock, flags);

	return 0;
}
#endif /* CONFIG_MALI_MIDGARD_DVFS */

int gpu_dvfs_get_level(struct exynos_context *platform, int freq)
{
	int i;

	for (i = 0; i < platform->table_size; i++) {
		if (platform->table[i].clock == freq)
			return i;
	}

	return -1;
}

int gpu_dvfs_get_voltage(struct exynos_context *platform, int freq)
{
	int i;

	for (i = 0; i < platform->table_size; i++) {
		if (platform->table[i].clock == freq)
			return platform->table[i].voltage;
	}

	return -1;
}
