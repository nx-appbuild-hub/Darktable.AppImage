SOURCE="https://bintray.com/probono/AppImages/download_file?file_path=Darktable-2.2.5.glibc2.14-x86_64.AppImage"
OUTPUT="Darktable.AppImage"

all:
	echo "Building: $(OUTPUT)"
	rm -f ./$(OUTPUT)
	wget --output-document=$(OUTPUT) --continue $(SOURCE)
	chmod +x $(OUTPUT)

