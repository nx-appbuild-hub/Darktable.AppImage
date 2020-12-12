# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)


all: clean

	mkdir --parents $(PWD)/build
	mkdir --parents $(PWD)/build/AppDir
	mkdir --parents $(PWD)/build/AppDir/vivaldi

	wget --output-document=$(PWD)/build/Darktable.AppImage https://bintray.com/probono/AppImages/download_file?file_path=Darktable-2.2.5.glibc2.14-x86_64.AppImage
	chmod +x $(PWD)/build/Darktable.AppImage

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/gtk3-3.22.30-6.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm https://ftp.lysator.liu.se/pub/opensuse/distribution/leap/15.2/repo/oss/x86_64/libatk-1_0-0-2.34.1-lp152.1.7.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm https://ftp.lysator.liu.se/pub/opensuse/distribution/leap/15.2/repo/oss/x86_64/libatk-bridge-2_0-0-2.34.1-lp152.1.5.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm https://ftp.lysator.liu.se/pub/opensuse/distribution/leap/15.2/repo/oss/x86_64/libatspi0-2.34.0-lp152.2.4.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/cairo-1.15.12-3.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/libgcrypt-1.8.5-4.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/bzip2-libs-1.0.6-26.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/xz-libs-5.2.4-3.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/libpng12-1.2.57-5.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/systemd-libs-239-41.el8_3.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/OpenEXR-libs-2.2.0-11.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/compat-exiv2-026-0.26-3.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/7/os/x86_64/Packages/cairo-1.15.12-4.el7.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/7/os/x86_64/Packages/libpng-1.5.13-8.el7.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..





	cd $(PWD)/build && $(PWD)/build/Darktable.AppImage --appimage-extract

	rm -rf $(PWD)/build/squashfs-root/AppRun
	rm -rf $(PWD)/build/squashfs-root/lib/x86_64-linux-gnu | true

	cp --force --recursive $(PWD)/build/usr/lib64/* $(PWD)/build/squashfs-root/usr/lib
	cp --force --recursive $(PWD)/build/usr/bin/* $(PWD)/build/squashfs-root/usr/bin
	cp --force --recursive $(PWD)/AppDir/* $(PWD)/build/squashfs-root/

	cp --force --recursive $(PWD)/build/squashfs-root/usr/share $(PWD)/build/squashfs-root
	cp --force --recursive $(PWD)/build/squashfs-root/usr/lib/x86_64-linux-gnu/* $(PWD)/build/squashfs-root/lib/x86_64-linux-gnu/
	rm -rf $(PWD)/build/squashfs-root/usr/lib/x86_64-linux-gnu
	rm -rf $(PWD)/build/squashfs-root/usr/share
	




	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage $(PWD)/build/squashfs-root $(PWD)/Darktable.AppImage
	chmod +x $(PWD)/Darktable.AppImage

clean:
	rm -rf $(PWD)/build
