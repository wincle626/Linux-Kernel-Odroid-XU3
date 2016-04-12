cmd_drivers/media/dvb-frontends/drxd_firm.o := gcc -Wp,-MD,drivers/media/dvb-frontends/.drxd_firm.o.d  -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabihf/5/include -I/root/odroidxu3-3.10.y/arch/arm/include -Iarch/arm/include/generated  -Iinclude -I/root/odroidxu3-3.10.y/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/root/odroidxu3-3.10.y/include/uapi -Iinclude/generated/uapi -include /root/odroidxu3-3.10.y/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-exynos/include -Iarch/arm/plat-samsung/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -std=gnu89 -O2 -fno-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -pg -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO -I/root/odroidxu3-3.10.y/drivers/media/dvb-core/ -I/root/odroidxu3-3.10.y/drivers/media/tuners/   -DMODULE  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(drxd_firm)"  -D"KBUILD_MODNAME=KBUILD_STR(drxd)" -c -o drivers/media/dvb-frontends/drxd_firm.o drivers/media/dvb-frontends/drxd_firm.c

source_drivers/media/dvb-frontends/drxd_firm.o := drivers/media/dvb-frontends/drxd_firm.c

deps_drivers/media/dvb-frontends/drxd_firm.o := \
    $(wildcard include/config//a.h) \
    $(wildcard include/config/fr/enable//m.h) \
    $(wildcard include/config/freqscan//m.h) \
    $(wildcard include/config/div/echo/enable//m.h) \
    $(wildcard include/config/slave//m.h) \
    $(wildcard include/config/div/blank/enable//m.h) \
  drivers/media/dvb-frontends/drxd_firm.h \
  include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  include/uapi/linux/types.h \
  arch/arm/include/generated/asm/types.h \
  /root/odroidxu3-3.10.y/include/uapi/asm-generic/types.h \
  include/asm-generic/int-ll64.h \
  include/uapi/asm-generic/int-ll64.h \
  arch/arm/include/generated/asm/bitsperlong.h \
  include/asm-generic/bitsperlong.h \
  include/uapi/asm-generic/bitsperlong.h \
  /root/odroidxu3-3.10.y/include/uapi/linux/posix_types.h \
  include/linux/stddef.h \
  include/uapi/linux/stddef.h \
  include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  include/linux/compiler-gcc5.h \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /root/odroidxu3-3.10.y/arch/arm/include/uapi/asm/posix_types.h \
  /root/odroidxu3-3.10.y/include/uapi/asm-generic/posix_types.h \
  drivers/media/dvb-frontends/drxd_map_firm.h \

drivers/media/dvb-frontends/drxd_firm.o: $(deps_drivers/media/dvb-frontends/drxd_firm.o)

$(deps_drivers/media/dvb-frontends/drxd_firm.o):
