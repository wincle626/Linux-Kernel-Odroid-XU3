cmd_drivers/scsi/iscsi_tcp.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o drivers/scsi/iscsi_tcp.ko drivers/scsi/iscsi_tcp.o drivers/scsi/iscsi_tcp.mod.o
