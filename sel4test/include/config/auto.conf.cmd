deps_config := \
	/home/mscapero/Desktop/sel4-benchmark/sel4test/tools/common/Kconfig \
	tools/elfloader/Kconfig \
	libs/libplatsupport/Kconfig \
	libs/libutils/Kconfig \
	libs/libsel4simple-stable/Kconfig \
	libs/libsel4simple-default/Kconfig \
	libs/libsel4simple/Kconfig \
	libs/libsel4test/Kconfig \
	libs/libsel4platsupport/Kconfig \
	libs/libsel4utils/Kconfig \
	libs/libelf/Kconfig \
	libs/libcpio/Kconfig \
	libs/libsel4allocman/Kconfig \
	libs/libsel4vspace/Kconfig \
	libs/libsel4vka/Kconfig \
	libs/libsel4muslcsys/Kconfig \
	libs/libmuslc/Kconfig \
	libs/libsel4/Kconfig \
	apps/sel4test-tests/Kconfig \
	apps/sel4test-driver/Kconfig \
	/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel/src/plat/pc99/Kconfig \
	kernel/Kconfig \
	Kconfig

include/config/auto.conf: \
	$(deps_config)

ifneq "$(KERNEL_ROOT_PATH)" "/home/mscapero/Desktop/sel4-benchmark/sel4test/kernel"
include/config/auto.conf: FORCE
endif
ifneq "$(COMMON_PATH)" "/home/mscapero/Desktop/sel4-benchmark/sel4test/tools/common"
include/config/auto.conf: FORCE
endif

$(deps_config): ;
