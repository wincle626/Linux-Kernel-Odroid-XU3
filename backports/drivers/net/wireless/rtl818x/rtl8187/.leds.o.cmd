cmd_backports/drivers/net/wireless/rtl818x/rtl8187/leds.o := gcc -Wp,-MD,backports/drivers/net/wireless/rtl818x/rtl8187/.leds.o.d -Ibackports/backport-include/ -Ibackports/backport-include/uapi -Ibackports/include/ -Ibackports/include/uapi -include backports/backport-include/backport/backport.h -I/root/odroidxu3-3.10.y/arch/arm/include -Iarch/arm/include/generated  -Iinclude -I/root/odroidxu3-3.10.y/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/root/odroidxu3-3.10.y/include/uapi -Iinclude/generated/uapi -include /root/odroidxu3-3.10.y/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-exynos/include -Iarch/arm/plat-samsung/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -std=gnu89 -O2 -fno-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -pg -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO -Ibackports/drivers/net/wireless/rtl818x   -DMODULE  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(leds)"  -D"KBUILD_MODNAME=KBUILD_STR(rtl8187)" -c -o backports/drivers/net/wireless/rtl818x/rtl8187/leds.o backports/drivers/net/wireless/rtl818x/rtl8187/leds.c

source_backports/drivers/net/wireless/rtl818x/rtl8187/leds.o := backports/drivers/net/wireless/rtl818x/rtl8187/leds.c

deps_backports/drivers/net/wireless/rtl818x/rtl8187/leds.o := \
    $(wildcard include/config/backport/rtl8187/leds.h) \
  /usr/include/stdc-predef.h \
  backports/backport-include/backport/backport.h \
    $(wildcard include/config/backport/integrate.h) \
  backports/backport-include/linux/version.h \
  include/generated/uapi/linux/version.h \

backports/drivers/net/wireless/rtl818x/rtl8187/leds.o: $(deps_backports/drivers/net/wireless/rtl818x/rtl8187/leds.o)

$(deps_backports/drivers/net/wireless/rtl818x/rtl8187/leds.o):
