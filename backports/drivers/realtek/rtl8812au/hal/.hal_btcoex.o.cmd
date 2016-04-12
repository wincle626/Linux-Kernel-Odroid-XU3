cmd_backports/drivers/realtek/rtl8812au/hal/hal_btcoex.o := gcc -Wp,-MD,backports/drivers/realtek/rtl8812au/hal/.hal_btcoex.o.d -Ibackports/backport-include/ -Ibackports/backport-include/uapi -Ibackports/include/ -Ibackports/include/uapi -include backports/backport-include/backport/backport.h -I/root/odroidxu3-3.10.y/arch/arm/include -Iarch/arm/include/generated  -Iinclude -I/root/odroidxu3-3.10.y/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/root/odroidxu3-3.10.y/include/uapi -Iinclude/generated/uapi -include /root/odroidxu3-3.10.y/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-exynos/include -Iarch/arm/plat-samsung/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -std=gnu89 -O2 -fno-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -pg -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO -O1 -Wno-unused-variable -Wno-unused-value -Wno-unused-label -Wno-unused-parameter -Wno-unused-function -Wno-unused -Ibackports/drivers/realtek/rtl8812au/include -Ibackports/drivers/realtek/rtl8812au/platform -DCONFIG_RTL8812A -DCONFIG_MP_INCLUDED -DCONFIG_POWER_SAVING -DCONFIG_TRAFFIC_PROTECT -DCONFIG_LOAD_PHY_PARA_FROM_FILE -DCONFIG_LITTLE_ENDIAN   -DMODULE  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(hal_btcoex)"  -D"KBUILD_MODNAME=KBUILD_STR(8812au)" -c -o backports/drivers/realtek/rtl8812au/hal/hal_btcoex.o backports/drivers/realtek/rtl8812au/hal/hal_btcoex.c

source_backports/drivers/realtek/rtl8812au/hal/hal_btcoex.o := backports/drivers/realtek/rtl8812au/hal/hal_btcoex.c

deps_backports/drivers/realtek/rtl8812au/hal/hal_btcoex.o := \
    $(wildcard include/config/bt/coexist.h) \
    $(wildcard include/config/lps/lclk.h) \
    $(wildcard include/config/concurrent/mode.h) \
    $(wildcard include/config/dualmac/concurrent.h) \
    $(wildcard include/config/p2p.h) \
    $(wildcard include/config/pci/hci.h) \
    $(wildcard include/config/usb/hci.h) \
    $(wildcard include/config/sdio/hci.h) \
    $(wildcard include/config/gspi/hci.h) \
  /usr/include/stdc-predef.h \
  backports/backport-include/backport/backport.h \
    $(wildcard include/config/backport/integrate.h) \
  backports/backport-include/linux/version.h \
  include/generated/uapi/linux/version.h \

backports/drivers/realtek/rtl8812au/hal/hal_btcoex.o: $(deps_backports/drivers/realtek/rtl8812au/hal/hal_btcoex.o)

$(deps_backports/drivers/realtek/rtl8812au/hal/hal_btcoex.o):
