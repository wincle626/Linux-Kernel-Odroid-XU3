cmd_drivers/target/target_core_mod.o := ld -EL    -r -o drivers/target/target_core_mod.o drivers/target/target_core_configfs.o drivers/target/target_core_device.o drivers/target/target_core_fabric_configfs.o drivers/target/target_core_fabric_lib.o drivers/target/target_core_hba.o drivers/target/target_core_pr.o drivers/target/target_core_alua.o drivers/target/target_core_tmr.o drivers/target/target_core_tpg.o drivers/target/target_core_transport.o drivers/target/target_core_sbc.o drivers/target/target_core_spc.o drivers/target/target_core_ua.o drivers/target/target_core_rd.o drivers/target/target_core_stat.o 
