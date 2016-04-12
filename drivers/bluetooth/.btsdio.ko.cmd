cmd_drivers/bluetooth/btsdio.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o drivers/bluetooth/btsdio.ko drivers/bluetooth/btsdio.o drivers/bluetooth/btsdio.mod.o
