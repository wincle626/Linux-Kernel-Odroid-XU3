#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

MODULE_INFO(intree, "Y");

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";

MODULE_ALIAS("hid:b0003g*v00006666p00008801");
MODULE_ALIAS("hid:b0003g*v00006666p00008802");
MODULE_ALIAS("hid:b0003g*v00006666p00008804");
MODULE_ALIAS("hid:b0003g*v00000925p00000005");
MODULE_ALIAS("hid:b0003g*v00000925p00008888");
MODULE_ALIAS("hid:b0003g*v00000925p00008866");
