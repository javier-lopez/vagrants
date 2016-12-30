#!/bin/sh
set -xe

. ~/.android_rc

[ -d /vagrant ] && cd /vagrant

example_app="examples/native-starter-kit"

#download app dependencies
cd "${example_app}" && yarn

#start react-native server
nohup react-native start > ~/react-native-packager.log 2>&1 </dev/null &
printf "%s\\n" "Waiting for react-native server to start"
sleep 5

env
#deploy
react-native run-android || (printf "%s\\n"
    printf "%s\\n" "Sometimes gradle success in building the apk but fails to upload it to the device"
    printf "%s\\n" "in such case upload it manually with:"
    printf "%s\\n" "$ adb install $(find ~/${example_app}/ -name "app-debug.apk")"
    printf "%s\\n")
printf "%s\\n" "Done: run $ tail -f react-native-packager.log to see react-native package msgs"
