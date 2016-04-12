cmd_crypto/pcrypt.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o crypto/pcrypt.ko crypto/pcrypt.o crypto/pcrypt.mod.o
