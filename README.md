# GCAndroid
Project is free to use, so if you buy from someone, please refund.

# About
What can do if Localhost?
* Lowest Ping
* Can edit the Code (Banner, Event, Abyss, and etc)
* Much you can do
## Note
This need [Ubuntu](https://ubuntu.com), [Termux](https://termux.dev/en/) and `Skillssss`. And this burdens your phone, so it's not recommended for low specs\
But, why not to try it... May i wrong XD

## Download
Download [Termux F-Droid](https://f-droid.org/repo/com.termux_118.apk) [RECOMMEND]\
OR\
Download [Termux Android 12+](https://github.com/HardcodedCat/termux-monet) (NEED ROOT OR ADB)

## Setup
1. Enter this command (install proot-distro/ubuntu)
```bash
pkg update -y && pkg install proot-distro -y && proot-distro install ubuntu
```
2. Login or enter mode Ubuntu with command
```bash
proot-distro login ubuntu
```
3. Now enter this command for can install Mongodb or with next Step
```bash
apts=$(cat /etc/apt/sources.list); echo -e "$apts\ndeb http://ports.ubuntu.com/ubuntu-ports/ focal main restricted\ndeb http://ports.ubuntu.com/ubuntu-ports/ focal-updates main restricted\ndeb http://ports.ubuntu.com/ubuntu-ports/ focal universe" > /etc/apt/sources.list && apt update && apt install sudo
```
4. Now next step to [install](https://github.com/ElaXan/GCAndroid#install)



## Install
### Script
Copy this and paste to Termux
[ONLY ONE TIME]
```bash
bash <(curl -s https://raw.githubusercontent.com/Score-Inc/GCAndroid/main/install.sh)
```
* If you want use that again just enter this command
```bash
gcandroid
```

## Edit Mongodb Database
If you want edit mongodb database, you can use [this app](https://play.google.com/store/apps/details?id=com.mongolime.app)\
If you don't have money to buy for the app, you can search for other apk or search for crack App that exist in Internet...

Make sure mongodb is running with this command
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
You can using [my script](https://github.com/Score-Inc/AnimeGamePatch)\
Select Menu when run mitmproxy by running command `zex 4`\
<img src="img/termux.png" width="350"/><br />
