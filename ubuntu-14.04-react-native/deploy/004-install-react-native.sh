#!/bin/sh
set -xe

command -v "react-native" >/dev/null 2>&1 || sudo yarn global add react-native-cli
command -v "flow" >/dev/null 2>&1         || sudo yarn global add flow
command -v "babel" >/dev/null 2>&1        || sudo yarn global add babel-cli
