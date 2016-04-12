cmd_drivers/bluetooth/btusb.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o drivers/bluetooth/btusb.ko drivers/bluetooth/btusb.o drivers/bluetooth/btusb.mod.o
