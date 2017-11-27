About
-----

react-native base environment, create native android/ios apps with js.

Usage
-----

- Connect an Android device with developer mode enabled OR install Genymotion and install a Nexus 5 or 7 (Android version 5.1). If using Genymotion, disable its ADB by selecting Settings -> ABD -> Use custom Android SDK tools
- Install openssh and rsync using your operating system's package manager or installation tools

**If on Windows:**

1. Install Cygwin. Within the installer, choose the rsync and openssh packages as per https://github.com/mitchellh/vagrant/issues/3913#issuecomment-45761049. Install "git", under the "Devel" category, to allow cloning this repository. Install xorg-server and xinit to allow launching Chrome for debugging.
2. If Vagrant/rsync [issue](https://github.com/mitchellh/vagrant/issues/6702) is not yet resolved, you will need to follow the instructions under https://github.com/mitchellh/vagrant/issues/6702#issuecomment-166503021
3. Launch a terminal using the "Cygwin terminal" shortcut on your desktop or Start Menu.
4. Run "startxwin" to launch a local X server for Chrome.

**If on OS X:**

1. Install XQuartz to enable viewing the developer console in Chrome within the VM.
2. Clone this repository and change to the new folder.

**If using an android device**

    vagrant up

**If using an emulator (replace IP address with your emulator's IP):**

    ADB_EMULATOR_IP_ADDRESS=192.168.56.101 vagrant up

Optionally, connect to the virtual machine and monitor the output of the react server:

    vagrant ssh -- -Y
    tail -f /tmp/react-native.log

The example `examples/native-starter-kit` app should now be deployed to the phone or emulator. Enable live reload using the "shake" gesture (Ctrl-m in Genymotion) and select "Enable Live Reload". Changes made to the code should automatically update on the device. To use the Chrome developer tools for debugging, start Chrome and connect to http://localhost:8081/debugger-ui and follow the instructions to install developer tools.

- Have fun!
