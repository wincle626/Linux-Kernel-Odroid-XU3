cmd_arch/arm/boot/dts/exynos5422-odroidxu3.dtb := gcc -E -Wp,-MD,arch/arm/boot/dts/.exynos5422-odroidxu3.dtb.d.pre.tmp -nostdinc -I/root/odroidxu3-3.10.y/arch/arm/boot/dts -I/root/odroidxu3-3.10.y/arch/arm/boot/dts/include -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/.exynos5422-odroidxu3.dtb.dts.tmp arch/arm/boot/dts/exynos5422-odroidxu3.dts ; /root/odroidxu3-3.10.y/scripts/dtc/dtc -O dtb -o arch/arm/boot/dts/exynos5422-odroidxu3.dtb -b 0 -i arch/arm/boot/dts/  -d arch/arm/boot/dts/.exynos5422-odroidxu3.dtb.d.dtc.tmp arch/arm/boot/dts/.exynos5422-odroidxu3.dtb.dts.tmp ; cat arch/arm/boot/dts/.exynos5422-odroidxu3.dtb.d.pre.tmp arch/arm/boot/dts/.exynos5422-odroidxu3.dtb.d.dtc.tmp > arch/arm/boot/dts/.exynos5422-odroidxu3.dtb.d

source_arch/arm/boot/dts/exynos5422-odroidxu3.dtb := arch/arm/boot/dts/exynos5422-odroidxu3.dts

deps_arch/arm/boot/dts/exynos5422-odroidxu3.dtb := \
  arch/arm/boot/dts/exynos5422_evt0.dtsi \
  arch/arm/boot/dts/exynos5.dtsi \
  arch/arm/boot/dts/skeleton.dtsi \
  arch/arm/boot/dts/exynos5422-pinctrl.dtsi \

arch/arm/boot/dts/exynos5422-odroidxu3.dtb: $(deps_arch/arm/boot/dts/exynos5422-odroidxu3.dtb)

$(deps_arch/arm/boot/dts/exynos5422-odroidxu3.dtb):
