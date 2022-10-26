# GCAndroid
What the benefit can i get by hosting a localhost using GCAndroid?
* Lower ping
* Access to edit server code (Banner, Event, Abyss, plugin, etc)
* And much more.
## Note
GCAndroid will require [Ubuntu](https://ubuntu.com), [Termux](https://termux.dev/en/) and `Skillssss`. Running this may burdens your phone depending on the device you're using, so it's not recommended for low specs.
But, why not to try it... I could be wrong XD

## Download
Download [Termux F-Droid](https://f-droid.org/repo/com.termux_118.apk) [RECOMMENDED]\
OR\
Download [Termux Android 12+](https://github.com/HardcodedCat/termux-monet) (REQUIRE ROOT OR ADB)

## Setup
1. Enter this command (install proot-distro/ubuntu)
```bash
pkg update -y && pkg install proot-distro -y && proot-distro install ubuntu
```
2. Login or enter Ubuntu mode with command
```bash
proot-distro login ubuntu
```
3. Now enter this command to install Mongodb
```bash
apts=$(cat /etc/apt/sources.list); echo -e "$apts\ndeb http://ports.ubuntu.com/ubuntu-ports/ focal main restricted\ndeb http://ports.ubuntu.com/ubuntu-ports/ focal-updates main restricted\ndeb http://ports.ubuntu.com/ubuntu-ports/ focal universe" > /etc/apt/sources.list && apt update && apt install sudo
```
4. Now for next step, follow [install](https://github.com/ElaXan/GCAndroid#install)



## Install
### Mongodb
Install mongodb If you're done with [setup](https://github.com/Score-Inc/GCAndroid#setup)
Copy this and paste to Termux
```bash
sudo apt-get update -y && sudo apt-get install mongodb curl -y
```
After the installation of mongodb completed, run it by copy and paste it to Termux
```bash
sudo service mongodb start
```
To stop mongodb, copy and paste it to Termux
```bash
pkill mongo && sudo service mongodb stop
```

### Grasscutter
GC installation procedure has been moved to [Script](https://github.com/Score-Inc/GCAndroid#script)

### Script
Copy this and paste to Termux
[ONLY ONE TIME]
```bash
bash <(curl -s https://raw.githubusercontent.com/Score-Inc/GCAndroid/main/install.sh)
```
* To run it for the second time, copy and paste this to Termux
```bash
gcandroid
```

## Edit Mongodb Database
To edit mongodb database, use [this app](https://play.google.com/store/apps/details?id=com.mongolime.app)\
If you don't have money to buy for the app, you can search for other apk or search for crack App that exist in Internet...

Make sure mongodb is running. To check its status copy and paste this to Termux
```bash
sudo service mongodb start
```
1. Open the App
2. And press/click on "New Connection"\
<img src="img/databaseEdit1.png" width="350"/><br />
3. You can enter/put name "Grasscutter" like this photo\
<img src="img/databaseEdit2.png" width="350"/><br />\
Don't change anything unless you change for the Port Mongodb. and then save it
4. Click on "Grasscutter"\
<img src="img/databaseEdit3.png" width="350"/><br />
5. Done, now you can edit Database


## Play
### Chinese APK
You need to use Termux for this or make your own Private DNS to redirect to localhost\
And dont ask me idk\
You can play without Private DNS or Termux, but it need Root/SuperUser permission\
And dont ask me how to root, go to [XDA](https://www.xda-developers.com/)


### Termux/mitmproxy
You can using [my script](https://github.com/Score-Inc/AnimeGamePatch) for change it enter number `3`\
<img src="img/termuxsss.png" width="350"/><br />
Or you can manual edit with\
`nano proxy_config.py`\
Change in `REMOTE_HOST` to **127.0.0.1**\
Change in `REMOTE_PORT` to **54321**
