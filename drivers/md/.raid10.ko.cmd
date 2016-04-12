cmd_drivers/md/raid10.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o drivers/md/raid10.ko drivers/md/raid10.o drivers/md/raid10.mod.o
