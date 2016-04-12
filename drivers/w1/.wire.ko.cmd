cmd_drivers/w1/wire.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o drivers/w1/wire.ko drivers/w1/wire.o drivers/w1/wire.mod.o
