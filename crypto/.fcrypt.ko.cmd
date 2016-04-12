cmd_crypto/fcrypt.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o crypto/fcrypt.ko crypto/fcrypt.o crypto/fcrypt.mod.o
