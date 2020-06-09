OUTPUT="DarkTable.AppImage"


all:
	echo "Building: $(OUTPUT)"

	wget --output-document=darktable.rpm --continue https://download.opensuse.org/repositories/graphics:/darktable:/master/openSUSE_Leap_15.1/x86_64/darktable-3.1.0~git2026.e3a096fa3-lp151.3240.1.x86_64.rpm
	rpm2cpio darktable.rpm | cpio -idmv

	wget --output-document=libIlmImf.rpm --continue https://ftp.lysator.liu.se/pub/opensuse/distribution/leap/15.1/repo/oss/x86_64/libIlmImf-2_2-23-2.2.1-lp151.3.1.x86_64.rpm
	rpm2cpio libIlmImf.rpm | cpio -idmv

	wget --output-document=libcurl-gnutls.rpm --continue http://mirror.centos.org/centos/7/os/x86_64/Packages/libcurl-7.29.0-57.el7.x86_64.rpm
	rpm2cpio libcurl-gnutls.rpm | cpio -idmv

	wget --output-document=libpng16.rpm --continue https://rpmfind.net/linux/fedora/linux/releases/30/Everything/x86_64/os/Packages/l/libpng-1.6.36-1.fc30.x86_64.rpm
	rpm2cpio libpng16.rpm | cpio -idmv

	wget --output-document=libexiv2.rpm --continue https://rpmfind.net/linux/mageia/distrib/6/x86_64/media/core/release/lib64exiv2_26-0.26-2.mga6.x86_64.rpm
	rpm2cpio libexiv2.rpm | cpio -idmv

	wget --output-document=GraphicsMagick.rpm --continue https://rpmfind.net/linux/opensuse/distribution/leap/15.0/repo/oss/x86_64/libGraphicsMagick-Q16-3-1.3.28-lp150.2.2.x86_64.rpm
	rpm2cpio GraphicsMagick.rpm | cpio -idmv

	wget --output-document=liblua5.rpm --continue https://rpmfind.net/linux/opensuse/distribution/leap/15.0/repo/oss/x86_64/liblua5_3-5-5.3.4-lp150.1.46.x86_64.rpm
	rpm2cpio liblua5.rpm | cpio -idmv

	wget --output-document=libpugixml1.rpm --continue https://rpmfind.net/linux/opensuse/distribution/leap/15.0/repo/oss/x86_64/libpugixml1-1.9-lp150.1.1.x86_64.rpm
	rpm2cpio libpugixml1.rpm | cpio -idmv

	wget --output-document=lib64Half23.rpm --continue https://rpmfind.net/linux/openmandriva/4.0/repository/x86_64/main/release/lib64Half23-2.2.1-3-omv4000.x86_64.rpm
	rpm2cpio lib64Half23.rpm | cpio -idmv

	wget --output-document=lib64Iex.rpm --continue https://rpmfind.net/linux/openmandriva/4.0/repository/x86_64/main/release/lib64Iex2_2_23-2.2.1-3-omv4000.x86_64.rpm
	rpm2cpio lib64Iex.rpm | cpio -idmv

	wget --output-document=lib64IlmThread.rpm --continue https://rpmfind.net/linux/openmandriva/4.0/repository/x86_64/main/release/lib64IlmThread2_2_23-2.2.1-3-omv4000.x86_64.rpm
	rpm2cpio lib64IlmThread.rpm | cpio -idmv

	wget --output-document=lib64ssh4.rpm --continue http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/libssh-0.9.0-4.el8.x86_64.rpm
	rpm2cpio lib64ssh4.rpm | cpio -idmv

	wget --output-document=libgcrypt20.rpm --continue https://rpmfind.net/linux/opensuse/distribution/leap/15.0/repo/oss/x86_64/libgcrypt20-1.8.2-lp150.4.2.x86_64.rpm
	rpm2cpio libgcrypt20.rpm | cpio -idmv

	wget --output-document=libgpg-error.rpm --continue https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/30/Everything/x86_64/os/Packages/l/libgpg-error-1.33-2.fc30.x86_64.rpm
	rpm2cpio libgpg-error.rpm | cpio -idmv

	wget --output-document=libidn.rpm --continue https://rpmfind.net/linux/mageia/distrib/3/x86_64/media/core/release/lib64idn11-1.26-2.mga3.x86_64.rpm
	rpm2cpio libidn.rpm | cpio -idmv

	wget --output-document=colord-gtk.rpm --continue https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/30/Everything/x86_64/os/Packages/c/colord-gtk-0.1.26-11.fc30.x86_64.rpm
	rpm2cpio colord-gtk.rpm | cpio -idmv

	wget --output-document=lib64jpeg8.rpm --continue https://www.rpmfind.net/linux/mageia/distrib/7/x86_64/media/core/release/lib64jpeg8-2.0.2-1.mga7.x86_64.rpm
	rpm2cpio lib64jpeg8.rpm | cpio -idmv

	wget --output-document=lib64curl4.rpm --continue https://rpmfind.net/linux/mageia/distrib/6/x86_64/media/core/release/lib64curl4-7.54.1-2.mga6.x86_64.rpm
	rpm2cpio lib64curl4.rpm | cpio -idmv

	mkdir -p AppDir/lib
	mkdir -p AppDir/application
	cp -r usr/bin/* AppDir/application
	cp -r usr/share AppDir/
	cp -r usr/lib/* AppDir/lib
	cp -r usr/lib64/* AppDir/lib

	mv AppDir/lib/libcurl.so.4 AppDir/lib/libcurl-gnutls.so.4


	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -f *.rpm
	rm -rf AppDir/application
	rm -rf AppDir/share
	rm -rf AppDir/lib
	rm -rf usr
