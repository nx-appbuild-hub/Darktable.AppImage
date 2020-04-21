SOURCE="https://download.opensuse.org/repositories/graphics:/darktable/xUbuntu_18.04/amd64/darktable_3.0.1-1.1_amd64.deb"
DESTINATION="build.deb"
OUTPUT="darktable.AppImage"
# libIlmImf-2_2.so.22

all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION) -c $(SOURCE)

	dpkg -x $(DESTINATION) build
	rm -rf AppDir/opt

	mkdir --parents AppDir/opt/application
	cp -r build/usr/share/darktable/* AppDir/opt/application
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
