cmd_drivers/input/mouse/synaptics_usb.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o drivers/input/mouse/synaptics_usb.ko drivers/input/mouse/synaptics_usb.o drivers/input/mouse/synaptics_usb.mod.o