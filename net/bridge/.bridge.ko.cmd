cmd_net/bridge/bridge.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o net/bridge/bridge.ko net/bridge/bridge.o net/bridge/bridge.mod.o
