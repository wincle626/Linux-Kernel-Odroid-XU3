cmd_crypto/cryptd.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o crypto/cryptd.ko crypto/cryptd.o crypto/cryptd.mod.o
