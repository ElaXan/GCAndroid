# GCAndroid
What can do if Localhost?
* Lowest Ping
* Can edit the Code (Banner, Event, Abyss, and etc)
* Much you can do
## Note
This need [Ubuntu](https://ubuntu.com) and [Termux](https://termux.dev/en/). And this burdens your phone, so it's not recommended for low specs

## Download
Download [Termux F-Droid](https://f-droid.org/repo/com.termux_118.apk)\
Download [Andronix](https://play.google.com/store/apps/details?id=studio.com.techriz.andronix)

## Setup
Open [Andronix](https://play.google.com/store/apps/details?id=studio.com.techriz.andronix)\
Select Ubuntu -> Click on "Proceed" -> Select "20.04" -> Select "Install" -> Select "Desktop Environment" -> Select "XFCE" -> Click "Open Termux"\
And paste on Termux then Enter on your Keyboard
* This need long time to install depends with your Internet

## Install
### Mongodb
If you already [setup](https://github.com/ElaXan/GCAndroid#setup) then now install mongodb
Copy this and paste to Termux
```bash
sudo apt-get update -y && sudo apt-get install mongodb curl -y
```
After success install mongodb and run it using this command
```bash
sudo service mongodb start
```
If want stop copy this and paste to Termux
```bash
pkill mongo && sudo service mongodb stop
```

### Grasscutter
For install Grasscutter\
Copy this and paste to Termux
```bash
sudo apt install curl -y && bash <(curl -s https://raw.githubusercontent.com/ElaXan/GCAndroid/main/Code/grasscutter_compile.sh?token=GHSAT0AAAAAABXMJEUC44ZDGK3RP52EJ2Y6YXPGKUA)
```

## Edit Mongodb Database
A. How to edit mongodb database??\
Q. You can using Visual Studio Code for edit database\
Please download same as your arch\
eg. Android much using arm64\
So download for arm64

* If you already download, then install it with `sudo dpkg -i <path-vscode.deb>`

* This need VNCServer for run or open VSCode so download it on Play Store
