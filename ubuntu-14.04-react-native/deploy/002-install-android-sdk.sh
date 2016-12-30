#!/bin/sh
set -xe

ANDROID_SDK_FILENAME="android-sdk_r24.2-linux.tgz"
ANDROID_SDK="http://dl.google.com/android/$ANDROID_SDK_FILENAME"

if [ ! -f "${ANDROID_SDK_FILENAME}" ]; then
    wget --progress=bar:force "${ANDROID_SDK}"
    tar -xzf "${ANDROID_SDK_FILENAME}"
fi

grep 'ANDROID_HOME'            ~/.android_rc || \
    printf "%s\\n" "export ANDROID_HOME=${HOME}/android-sdk-linux" >> ~/.android_rc
grep 'JAVA_HOME'               ~/.android_rc || \
    printf "%s\\n" "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/" >> ~/.android_rc
grep 'android-sdk-linux/tools' ~/.android_rc || \
    printf "%s\\n" "export PATH=${PATH}:${HOME}/android-sdk-linux/tools:${HOME}/android-sdk-linux/platform-tools" >> ~/.android_rc

grep '~/.android_rc' ~/.bashrc || printf "%s\\n" ". ~/.android_rc" >> ~/.bashrc

if [ ! -d ~/android-sdk-linux/platforms/android-23 ]; then
    expect -c '
set timeout -1   ;
spawn ~/android-sdk-linux/tools/android update sdk -u --all --filter platform-tools,tools,build-tools-23,build-tools-23.0.1,build-tools-23.0.2,build-tools-23.1,build-tools-23.1.1,build-tools-23.1.2,build-tools-23,build-tools-23.0.1,android-22,android-23,addon-google_apis_x86-google-23,extra-android-support,extra-android-m2repository,extra-google-m2repository,extra-google-google_play_services,sys-img-armeabi-v7a-android-23
expect {
    "Do you accept the license" { exp_send "y\r" ; exp_continue }
    eof
}'
fi

command -v "adb" >/dev/null 2>&1 || sudo ln -s ~/android-sdk-linux/platform-tools/adb /usr/bin/adb
