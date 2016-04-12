cmd_drivers/md/multipath.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o drivers/md/multipath.ko drivers/md/multipath.o drivers/md/multipath.mod.o
