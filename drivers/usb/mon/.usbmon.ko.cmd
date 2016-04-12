cmd_drivers/usb/mon/usbmon.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o drivers/usb/mon/usbmon.ko drivers/usb/mon/usbmon.o drivers/usb/mon/usbmon.mod.o
