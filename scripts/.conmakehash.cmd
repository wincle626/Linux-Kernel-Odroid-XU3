cmd_scripts/conmakehash := gcc -Wp,-MD,scripts/.conmakehash.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89   -I/root/odroidxu3-3.10.y/tools/include  -o scripts/conmakehash scripts/conmakehash.c  

source_scripts/conmakehash := scripts/conmakehash.c

deps_scripts/conmakehash := \
  /usr/include/stdc-predef.h \
  /usr/include/stdio.h \
  /usr/include/features.h \
  /usr/include/arm-linux-gnueabihf/sys/cdefs.h \
  /usr/include/arm-linux-gnueabihf/bits/wordsize.h \
  /usr/include/arm-linux-gnueabihf/gnu/stubs.h \
  /usr/include/arm-linux-gnueabihf/gnu/stubs-hard.h \
  /usr/lib/gcc/arm-linux-gnueabihf/5/include/stddef.h \
  /usr/include/arm-linux-gnueabihf/bits/types.h \
  /usr/include/arm-linux-gnueabihf/bits/typesizes.h \
  /usr/include/libio.h \
  /usr/include/_G_config.h \
  /usr/include/wchar.h \
  /usr/lib/gcc/arm-linux-gnueabihf/5/include/stdarg.h \
  /usr/include/arm-linux-gnueabihf/bits/stdio_lim.h \
  /usr/include/arm-linux-gnueabihf/bits/sys_errlist.h \
  /usr/include/arm-linux-gnueabihf/bits/stdio.h \
  /usr/include/arm-linux-gnueabihf/bits/stdio2.h \
  /usr/include/stdlib.h \
  /usr/include/arm-linux-gnueabihf/bits/waitflags.h \
  /usr/include/arm-linux-gnueabihf/bits/waitstatus.h \
  /usr/include/endian.h \
  /usr/include/arm-linux-gnueabihf/bits/endian.h \
  /usr/include/arm-linux-gnueabihf/bits/byteswap.h \
  /usr/include/arm-linux-gnueabihf/bits/byteswap-16.h \
  /usr/include/arm-linux-gnueabihf/sys/types.h \
  /usr/include/time.h \
  /usr/include/arm-linux-gnueabihf/sys/select.h \
  /usr/include/arm-linux-gnueabihf/bits/select.h \
  /usr/include/arm-linux-gnueabihf/bits/sigset.h \
  /usr/include/arm-linux-gnueabihf/bits/time.h \
  /usr/include/arm-linux-gnueabihf/bits/select2.h \
  /usr/include/arm-linux-gnueabihf/sys/sysmacros.h \
  /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h \
  /usr/include/alloca.h \
  /usr/include/arm-linux-gnueabihf/bits/stdlib-bsearch.h \
  /usr/include/arm-linux-gnueabihf/bits/stdlib-float.h \
  /usr/include/arm-linux-gnueabihf/bits/stdlib.h \
  /usr/include/sysexits.h \
  /usr/include/string.h \
  /usr/include/xlocale.h \
  /usr/include/arm-linux-gnueabihf/bits/string.h \
  /usr/include/arm-linux-gnueabihf/bits/string2.h \
  /usr/include/arm-linux-gnueabihf/bits/string3.h \
  /usr/include/ctype.h \

scripts/conmakehash: $(deps_scripts/conmakehash)

$(deps_scripts/conmakehash):
