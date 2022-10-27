<p align="center">
    <img src="gif/20221026_150902.gif" alt="gif animated" width="450" height="100">
</p>

# GCAndroid

Project is free to use. If you bought it from someone, Please refund\
When I see someone selling GCAndroid, then I will close the source code\
Open source code will be available for [Team](https://github.com/Score-Inc)

# About

What the benefit can i get by hosting a localhost using GCAndroid?
* Lower ping
* Access to edit server code (Banner, Event, Abyss, plugin, etc)
* And much more.

## Note

GCAndroid will require [Ubuntu](https://ubuntu.com), [Termux](https://termux.dev/en/) and `Skillssss`.\
Running this may burdens your phone depending on the device you're using,\
so it's not recommended to run this on low specs device.\
But, why don't you try it... I could be wrong XD

## Download

Download [Termux F-Droid](https://f-droid.org/repo/com.termux_118.apk) [RECOMMENDED]\
OR\
Download [Termux Android 12+](https://github.com/HardcodedCat/termux-monet) (REQUIRE ROOT OR ADB)

## Setup

Note : All commands are executed inside Termux

1. To install proot-distro/ubuntu, run this command
```bash
pkg update -y && pkg install proot-distro -y && proot-distro install ubuntu
```
2. To login or enter Ubuntu mode, run this command
```bash
proot-distro login ubuntu
```
3. To install Mongodb, run this command
```bash
apts=$(cat /etc/apt/sources.list); echo -e "$apts\ndeb http://ports.ubuntu.com/ubuntu-ports/ focal main restricted\ndeb http://ports.ubuntu.com/ubuntu-ports/ focal-updates main restricted\ndeb http://ports.ubuntu.com/ubuntu-ports/ focal universe" > /etc/apt/sources.list && apt update && apt install sudo
```
4. Next is [installation](https://github.com/Score-Inc/GCAndroid#install)


## Install

### Script

To download GCAndroid, run this command (One time only)
```bash
bash <(curl -s https://raw.githubusercontent.com/Score-Inc/GCAndroid/main/install.sh)
```
* To run it for the next time, use this command instead
```bash
gcandroid
```

## Edit Mongodb Database

Note : All commands are executed inside Termux

To edit mongodb database, use [this app](https://play.google.com/store/apps/details?id=com.mongolime.app)\
If you don't have money to buy for the app, you can search for other apk or search for crack App that exist in Internet...

To edit mongodb database, make sure the service has started.
To start mongodb, run this command
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

Termux is required for this or make your own Private DNS to redirect to localhost\
And dont ask me, idk\
You can play without Private DNS or Termux, but it need Root/SuperUser permission\
And dont ask me how to root, go to [XDA](https://www.xda-developers.com/)


### Termux/mitmproxy

You can use [my script](https://github.com/Score-Inc/AnimeGamePatch)\
Select Menu on mitmproxy by running command `zex 4`\
<img src="img/termux.png" width="350"/><br />
