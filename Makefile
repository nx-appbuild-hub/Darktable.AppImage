SOURCE="https://github.com/darktable-org/darktable/releases/download/release-3.0.2/darktable-3.0.2.tar.xz"
DESTINATION="darktable.deb"
OUTPUT="darktable.AppImage"
# libIlmImf-2_2.so.22

all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION) -c $(SOURCE)

	tar -xJvf $(DESTINATION)
	# rm -rf AppDir/opt
	#
	# mkdir --parents AppDir/opt/application
	# cp -r build/usr/share/darktable/* AppDir/opt/application
	#
	# chmod +x AppDir/AppRun
	#
	# appimagetool AppDir $(OUTPUT)
	#
	# chmod +x $(OUTPUT)
	#
	# rm -f $(DESTINATION)
	# rm -rf AppDir/opt
	# rm -rf build
