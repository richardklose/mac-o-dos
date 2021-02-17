#!/usr/bin/env bash

print_usage() {
	echo "  This script creates a macOS Dosbox-X wrapper app for dos applications. All you need is:"
	echo "    - The name of the DOS application"
	echo "    - The original DOS files of the application"
	echo "    - A suitable dosbox config file"
	echo ""
	echo "  Usage:"
	echo ""
	echo "    ./mac-o-dos.sh --name=<appname> --conf=<path_to_dosbox.conf> --app=<path_to_dos_app_dir>"
	echo ""
	echo "  Options:"
	echo "    -n, --name                (Required)     The desired name of the final macOS app."
	echo "    -c, --conf                (Required)     Path to the Dosbox-X config file that should be used to execute the DOS application."
	echo "    -a, --app                 (Required)     Path to the directory with the files of the DOS applications."
	echo "    -d, --dosbox-version      (Optional)     Version of Dosbox-X that should be used inside the final app. (Does not work with versions prior 0.83.10)"
	echo "    --arm                     (Optional)     Use the ARM version of Dosbox-X for Apple Silicon Macs."
	echo ""
}


DOSBOX_X_VERSION=0.83.10

for i in "$@"; do
case $i in
	-c=*|--conf=*)
		CONFIG_FILE="${i#*=}"
		shift
		;;
	-a=*|--app=*)
		APP_DIR="${i#*=}"
		shift
		;;
	--arm)
		FOR_ARM=true
		shift
		;;
	-n=*|--name=*)
		APPNAME="${i#*=}"
		shift
		;;
	-d=*|--dosbox-x-version=*)
		DOSBOX_VERSION="${i#*=}"
		shift
		;;
	*)
		print_usage
		;;
esac
done

DOWNLOAD_URL="https://github.com/joncampbell123/dosbox-x/releases/download/dosbox-x-v${DOSBOX_X_VERSION}/dosbox-x-macosx-${DOSBOX_X_VERSION}-bin64.zip"

[[ -z $CONFIG_FILE ]] && echo "No config file given." && exit 1
[[ -z $APP_DIR ]] && echo "No application folder given." && exit 1
[[ -z $APPNAME ]] && echo "No app name given." && exit 1

! [[ -f ${CONFIG_FILE} ]] && echo "dosbox config file does not exists" && exit 1
! [[ -d ${APP_DIR} ]] && echo "application directory does not exists" && exit 1

DIR="out/${APPNAME}.app/Contents/MacOS";
RES="out/${APPNAME}.app/Contents/Resources";

if [ -d "${PWD}/out/${APPNAME}.app" ]; then
	echo "${PWD}/out/${APPNAME}.app already exists.";
	exit 1;
fi;

echo ""
echo " STEP 1: Download Dosbox-X v ${DOSBOX_X_VERSION} from GitHub"
curl -L -# -o "${PWD}/assets/dosbox-x.zip" "${DOWNLOAD_URL}" 
unzip -q -d "${PWD}/assets/tmp/" "${PWD}/assets/dosbox-x.zip"
rm "${PWD}/assets/dosbox-x.zip"
echo ""
echo " STEP 2: Create App Directories"
mkdir -p "${DIR}" "${RES}";
echo ""
echo " STEP 3: Install Dosbox-X Wrapper"
cp "assets/run.sh" "${DIR}/${APPNAME}";
chmod +x "${DIR}/${APPNAME}";
echo ""
echo " STEP 4: Install Dosbox-X Config File"
cp "${CONFIG_FILE}" "${RES}"
echo ""
echo " STEP 5: Install DOS application"
cp -r "${APP_DIR}" "${RES}"
echo ""
if [ $FOR_ARM ]; then
	echo " STEP 6: Install Dosbox-X for Apple Silicon Macs"
	cp -r "assets/tmp/ARM-based Mac (arm64)/dosbox-x-sdl2/dosbox-x.app" "${RES}"
else
	echo " STEP 6: Install Dosbox-X for Intel Macs"
	cp -r "assets/tmp/Intel-based Mac (x86_64)/dosbox-x-sdl2/dosbox-x.app" "${RES}"
fi
rm -r "assets/tmp"
echo ""
echo " ✨ Congratulations! Here is your DOS application wrapped for macOS:"
echo " ${PWD}/out/$APPNAME.app";
