cmd_net/vmw_vsock/vsock.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o net/vmw_vsock/vsock.ko net/vmw_vsock/vsock.o net/vmw_vsock/vsock.mod.o
