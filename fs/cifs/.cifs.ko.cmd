cmd_fs/cifs/cifs.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o fs/cifs/cifs.ko fs/cifs/cifs.o fs/cifs/cifs.mod.o
