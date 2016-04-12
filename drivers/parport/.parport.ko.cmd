cmd_drivers/parport/parport.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o drivers/parport/parport.ko drivers/parport/parport.o drivers/parport/parport.mod.o
