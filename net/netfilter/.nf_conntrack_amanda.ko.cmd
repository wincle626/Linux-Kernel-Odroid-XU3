cmd_net/netfilter/nf_conntrack_amanda.ko := ld -EL -r  -T /root/odroidxu3-3.10.y/scripts/module-common.lds --build-id  -o net/netfilter/nf_conntrack_amanda.ko net/netfilter/nf_conntrack_amanda.o net/netfilter/nf_conntrack_amanda.mod.o