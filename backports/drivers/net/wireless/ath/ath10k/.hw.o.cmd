cmd_backports/drivers/net/wireless/ath/ath10k/hw.o := gcc -Wp,-MD,backports/drivers/net/wireless/ath/ath10k/.hw.o.d -Ibackports/backport-include/ -Ibackports/backport-include/uapi -Ibackports/include/ -Ibackports/include/uapi -include backports/backport-include/backport/backport.h -I/root/odroidxu3-3.10.y/arch/arm/include -Iarch/arm/include/generated  -Iinclude -I/root/odroidxu3-3.10.y/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/root/odroidxu3-3.10.y/include/uapi -Iinclude/generated/uapi -include /root/odroidxu3-3.10.y/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-exynos/include -Iarch/arm/plat-samsung/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -std=gnu89 -O2 -fno-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -pg -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO   -DMODULE  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(hw)"  -D"KBUILD_MODNAME=KBUILD_STR(ath10k_core)" -c -o backports/drivers/net/wireless/ath/ath10k/hw.o backports/drivers/net/wireless/ath/ath10k/hw.c

source_backports/drivers/net/wireless/ath/ath10k/hw.o := backports/drivers/net/wireless/ath/ath10k/hw.c

deps_backports/drivers/net/wireless/ath/ath10k/hw.o := \
  /usr/include/stdc-predef.h \
  backports/backport-include/backport/backport.h \
    $(wildcard include/config/backport/integrate.h) \
  backports/backport-include/linux/version.h \
  include/generated/uapi/linux/version.h \
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
  backports/backport-include/linux/compiler.h \
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
  backports/drivers/net/wireless/ath/ath10k/hw.h \
    $(wildcard include/config/mask.h) \
    $(wildcard include/config/offset.h) \
    $(wildcard include/config/bidir/od/data/lsb.h) \
    $(wildcard include/config/bidir/od/data/mask.h) \
    $(wildcard include/config/i2c/lsb.h) \
    $(wildcard include/config/i2c/mask.h) \
    $(wildcard include/config/pos/sample/lsb.h) \
    $(wildcard include/config/pos/sample/mask.h) \
    $(wildcard include/config/inactive/data/lsb.h) \
    $(wildcard include/config/inactive/data/mask.h) \
    $(wildcard include/config/inactive/clk/lsb.h) \
    $(wildcard include/config/inactive/clk/mask.h) \
    $(wildcard include/config/divider/lsb.h) \
    $(wildcard include/config/divider/mask.h) \
  backports/drivers/net/wireless/ath/ath10k/targaddrs.h \

backports/drivers/net/wireless/ath/ath10k/hw.o: $(deps_backports/drivers/net/wireless/ath/ath10k/hw.o)

$(deps_backports/drivers/net/wireless/ath/ath10k/hw.o):
