#!/bin/bash
# Script to save the modified configuration as aesd_qemu_defconfig and linux kernel configuration.

cd `dirname $0`
source shared.sh
mkdir -p base_external/configs/

make -C buildroot BR2_EXTERNAL=../base_external savedefconfig \
     BR2_DEFCONFIG=${AESD_MODIFIED_DEFCONFIG_REL_BUILDROOT}

if [ -e buildroot/.config ] && ls buildroot/output/build/linux-*/.config >/dev/null 2>&1; then
    grep "BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE" buildroot/.config > /dev/null
    if [ $? -eq 0 ]; then
        echo "Saving linux defconfig"
        make -C buildroot BR2_EXTERNAL=../base_external linux-update-defconfig
    fi
fi
