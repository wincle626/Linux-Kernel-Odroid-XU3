cmd_crypto/vmac.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o crypto/vmac.ko crypto/vmac.o crypto/vmac.mod.o
