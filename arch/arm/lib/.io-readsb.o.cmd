cmd_arch/arm/lib/io-readsb.o := gcc -Wp,-MD,arch/arm/lib/.io-readsb.o.d  -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabihf/5/include -I/root/odroidxu3-3.10.y/arch/arm/include -Iarch/arm/include/generated  -Iinclude -I/root/odroidxu3-3.10.y/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/root/odroidxu3-3.10.y/include/uapi -Iinclude/generated/uapi -include /root/odroidxu3-3.10.y/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-exynos/include -Iarch/arm/plat-samsung/include  -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a  -include asm/unified.h -msoft-float          -c -o arch/arm/lib/io-readsb.o arch/arm/lib/io-readsb.S

source_arch/arm/lib/io-readsb.o := arch/arm/lib/io-readsb.S

deps_arch/arm/lib/io-readsb.o := \
  /root/odroidxu3-3.10.y/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  include/linux/linkage.h \
  include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  include/linux/stringify.h \
  include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
  /root/odroidxu3-3.10.y/arch/arm/include/asm/linkage.h \
  /root/odroidxu3-3.10.y/arch/arm/include/asm/assembler.h \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/cpu/use/domains.h) \
  /root/odroidxu3-3.10.y/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
  /root/odroidxu3-3.10.y/arch/arm/include/uapi/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
  /root/odroidxu3-3.10.y/arch/arm/include/asm/hwcap.h \
  /root/odroidxu3-3.10.y/arch/arm/include/uapi/asm/hwcap.h \
  /root/odroidxu3-3.10.y/arch/arm/include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
  /root/odroidxu3-3.10.y/arch/arm/include/asm/opcodes-virt.h \
  /root/odroidxu3-3.10.y/arch/arm/include/asm/opcodes.h \
    $(wildcard include/config/cpu/endian/be32.h) \

arch/arm/lib/io-readsb.o: $(deps_arch/arm/lib/io-readsb.o)

$(deps_arch/arm/lib/io-readsb.o):
