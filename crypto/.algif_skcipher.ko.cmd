cmd_crypto/algif_skcipher.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o crypto/algif_skcipher.ko crypto/algif_skcipher.o crypto/algif_skcipher.mod.o
