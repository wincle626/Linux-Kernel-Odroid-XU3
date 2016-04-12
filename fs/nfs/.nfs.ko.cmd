cmd_fs/nfs/nfs.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o fs/nfs/nfs.ko fs/nfs/nfs.o fs/nfs/nfs.mod.o
