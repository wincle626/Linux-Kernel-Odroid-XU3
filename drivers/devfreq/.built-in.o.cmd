cmd_drivers/devfreq/built-in.o :=  ld -EL    -r -o drivers/devfreq/built-in.o drivers/devfreq/devfreq.o drivers/devfreq/governor_simpleondemand.o drivers/devfreq/governor_simpleexynos.o drivers/devfreq/governor_simpleusage.o drivers/devfreq/governor_performance.o drivers/devfreq/governor_powersave.o drivers/devfreq/governor_userspace.o drivers/devfreq/exynos5422_bus_mif.o drivers/devfreq/exynos5422_bus_int.o drivers/devfreq/exynos5422_ppmu.o drivers/devfreq/exynos_ppmu.o drivers/devfreq/noc_probe.o 
