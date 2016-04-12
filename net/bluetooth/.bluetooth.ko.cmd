cmd_net/bluetooth/bluetooth.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o net/bluetooth/bluetooth.ko net/bluetooth/bluetooth.o net/bluetooth/bluetooth.mod.o
