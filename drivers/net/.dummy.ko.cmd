cmd_drivers/net/dummy.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o drivers/net/dummy.ko drivers/net/dummy.o drivers/net/dummy.mod.o
