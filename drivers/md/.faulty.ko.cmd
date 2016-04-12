cmd_drivers/md/faulty.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o drivers/md/faulty.ko drivers/md/faulty.o drivers/md/faulty.mod.o
