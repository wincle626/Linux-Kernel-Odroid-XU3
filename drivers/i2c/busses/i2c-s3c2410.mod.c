#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

MODULE_INFO(intree, "Y");

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";

MODULE_ALIAS("of:N*T*Csamsung,s3c2410-i2c*");
MODULE_ALIAS("of:N*T*Csamsung,s3c2440-i2c*");
MODULE_ALIAS("of:N*T*Csamsung,s3c2440-hdmiphy-i2c*");
MODULE_ALIAS("of:N*T*Csamsung,exynos5430-fimc-i2c*");
MODULE_ALIAS("of:N*T*Csamsung,exynos5440-i2c*");
MODULE_ALIAS("platform:s3c2410-i2c");
MODULE_ALIAS("platform:s3c2440-i2c");
MODULE_ALIAS("platform:s3c2440-hdmiphy-i2c");
MODULE_ALIAS("platform:exynos5430-fimc-i2c");
