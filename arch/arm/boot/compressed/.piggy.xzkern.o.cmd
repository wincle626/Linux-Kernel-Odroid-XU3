cmd_arch/arm/boot/compressed/piggy.xzkern.o := gcc -Wp,-MD,arch/arm/boot/compressed/.piggy.xzkern.o.d  -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabihf/5/include -I/root/odroidxu3-3.10.y/arch/arm/include -Iarch/arm/include/generated  -Iinclude -I/root/odroidxu3-3.10.y/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/root/odroidxu3-3.10.y/include/uapi -Iinclude/generated/uapi -include /root/odroidxu3-3.10.y/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-exynos/include -Iarch/arm/plat-samsung/include  -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a  -include asm/unified.h -msoft-float      -DZIMAGE     -c -o arch/arm/boot/compressed/piggy.xzkern.o arch/arm/boot/compressed/piggy.xzkern.S

source_arch/arm/boot/compressed/piggy.xzkern.o := arch/arm/boot/compressed/piggy.xzkern.S

deps_arch/arm/boot/compressed/piggy.xzkern.o := \
  /root/odroidxu3-3.10.y/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/thumb2/kernel.h) \

arch/arm/boot/compressed/piggy.xzkern.o: $(deps_arch/arm/boot/compressed/piggy.xzkern.o)

$(deps_arch/arm/boot/compressed/piggy.xzkern.o):
