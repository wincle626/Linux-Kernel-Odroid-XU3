cmd_lib/raid6/int16.c := awk -f/root/odroidxu3-3.10.y/lib/raid6/unroll.awk -vN=16 < lib/raid6/int.uc > lib/raid6/int16.c || ( rm -f lib/raid6/int16.c && exit 1 )
