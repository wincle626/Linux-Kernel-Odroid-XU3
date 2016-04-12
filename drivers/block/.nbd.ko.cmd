cmd_drivers/block/nbd.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o drivers/block/nbd.ko drivers/block/nbd.o drivers/block/nbd.mod.o
