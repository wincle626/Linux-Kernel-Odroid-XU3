cmd_drivers/md/md-mod.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o drivers/md/md-mod.ko drivers/md/md-mod.o drivers/md/md-mod.mod.o
