objects = linux-imx uboot-imx imx-atf imx-optee-os imx-mkimage
all: $(objects)

.PHONY : $(objects) clean

setup_env:
	chmod +x ./tools/fsl-imx-wayland-glibc-x86_64-core-image-minimal-aarch64-imx8mqevk-toolchain-5.4-zeus.sh
	./tools/fsl-imx-wayland-glibc-x86_64-core-image-minimal-aarch64-imx8mqevk-toolchain-5.4-zeus.sh -d ./sdk -y -R
	sudo apt install libssl-dev autoconf automake bc bison build-essential ccache cscope curl device-tree-compiler expect flex ftp-upload gdisk iasl libattr1-dev libcap-dev libfdt-dev libftdi-dev libglib2.0-dev libhidapi-dev libncurses5-dev libpixman-1-dev libssl-dev libtool make mtools netcat python-crypto python3-crypto python-pyelftools python3-pycryptodome python3-pyelftools python-serial python3-serial rsync unzip uuid-dev xdg-utils xterm xz-utils zlib1g-dev
	pip3 install pycryptodomex pycryptodome pyelftools
	rename 's/python/deprecated-python/' ./sdk/sysroots/x86_64-pokysdk-linux/usr/bin/python*

get_source_code:
	-git clone https://source.codeaurora.org/external/imx/imx-atf -b imx_5.4.47_2.2.0
	-git clone https://source.codeaurora.org/external/imx/uboot-imx -b imx_v2020.04_5.4.47_2.2.0
	-git clone https://source.codeaurora.org/external/imx/imx-optee-os -b imx_5.4.47_2.2.0
	-git clone https://source.codeaurora.org/external/imx/linux-imx -b imx_5.4.47_2.2.0
	-git clone https://source.codeaurora.org/external/imx/imx-mkimage -b imx_5.4.47_2.2.0

linux-imx:
	cd linux-imx && make imx_v8_defconfig && make -j8

uboot-imx:
	cd uboot-imx && make imx8mq_evk_config && make -j8

imx-atf:
	cd imx-atf && unset LDFLAGS && make -j8 PLAT=imx8mq clean BUILD_BASE=build-optee && make -j8 PLAT=imx8mq BUILD_BASE=build-optee SPD=opteed bl31

imx-optee-os:
	cd imx-optee-os && unset ARCH && make -j8 PLATFORM=imx PLATFORM_FLAVOR=mx8mqevk CROSS_COMPILE=aarch64-poky-linux- CROSS_COMPILE64=aarch64-poky-linux- LDFLAGS= O=./build.mx8mqevk CFG_WERROR=y CFG_TEE_CORE_LOG_LEVEL=1 CFG_TEE_TA_LOG_LEVEL=0 all && export ARCH=arm64

imx-mkimage: setup_env get_source_code uboot-imx imx-atf imx-optee-os
	cp uboot-imx/u-boot-nodtb.bin imx-mkimage/iMX8M/
	cp uboot-imx/u-boot.bin imx-mkimage/iMX8M/
	cp uboot-imx/spl/u-boot-spl.bin imx-mkimage/iMX8M/
	cp uboot-imx/arch/arm/dts/imx8mq-evk.dtb imx-mkimage/iMX8M/
	cp uboot-imx/tools/mkimage imx-mkimage/iMX8M/mkimage_uboot
	cp firmware/hdmi/cadence/signed_hdmi_imx8m.bin imx-mkimage/iMX8M/
	cp firmware/ddr/synopsys/lpddr4_pmu_train_1d_imem.bin imx-mkimage/iMX8M/
	cp firmware/ddr/synopsys/lpddr4_pmu_train_1d_dmem.bin imx-mkimage/iMX8M/
	cp firmware/ddr/synopsys/lpddr4_pmu_train_2d_imem.bin imx-mkimage/iMX8M/
	cp firmware/ddr/synopsys/lpddr4_pmu_train_2d_dmem.bin imx-mkimage/iMX8M/
	cp imx-atf/build-optee/imx8mq/release/bl31.bin imx-mkimage/iMX8M/
	aarch64-poky-linux-objcopy -O binary imx-optee-os/build.mx8mqevk/core/tee.elf imx-mkimage/iMX8M/tee.bin
	cd imx-mkimage && make SOC=iMX8M clean && make SOC=iMX8M flash_hdmi_spl_uboot

	

