cmd_drivers/usb/misc/usbsevseg.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o drivers/usb/misc/usbsevseg.ko drivers/usb/misc/usbsevseg.o drivers/usb/misc/usbsevseg.mod.o