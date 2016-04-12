cmd_net/wimax/wimax.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o net/wimax/wimax.ko net/wimax/wimax.o net/wimax/wimax.mod.o
