cmd_drivers/usb/serial/safe_serial.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o drivers/usb/serial/safe_serial.ko drivers/usb/serial/safe_serial.o drivers/usb/serial/safe_serial.mod.o
