<p align="center">
    <img src="gif/20221026_150902.gif" alt="gif animated" width="450" height="100">
</p>

# GCAndroid

Project is free to use. If you bought it from someone, please refund\
When I see someone selling GCAndroid, then I will close the source code\
Open source code will only be available for whoever affiliated with [Score Inc](https://github.com/Score-Inc)

## About
What can I do with a Localhost Server?
* The lowest Ping possible.
* The abillity to change the (Banners, Events, Abyss, and etc)
* Much more
## Prerequisites
The Requirments are as follows: [Ubuntu](https://ubuntu.com), [Termux](https://termux.dev/en/) and a ton of `Skillssss`. This may burden your phone, so it's not recommended for low spec devices. \
But, why not try it? I could be wrong XD

## Download links
Download [Termux F-Droid](https://f-droid.org/repo/com.termux_118.apk) [RECOMMEND]\
OR\
Download [Termux Android 12+](https://github.com/HardcodedCat/termux-monet) (NEED ROOT OR ADB)

## Setup

Note : All commands are to be executed inside Termux

1. In order to install proot-distro/ubuntu, run this command
```bash
pkg update -y && pkg install proot-distro -y && proot-distro install ubuntu
```
2. Login or enter the Ubuntu mode using the command:
```bash
proot-distro login ubuntu
```
3. Now enter this command in order to install Mongodb for the next step:
```bash
apts=$(cat /etc/apt/sources.list); echo -e "$apts\ndeb http://ports.ubuntu.com/ubuntu-ports/ focal main restricted\ndeb http://ports.ubuntu.com/ubuntu-ports/ focal-updates main restricted\ndeb http://ports.ubuntu.com/ubuntu-ports/ focal universe" > /etc/apt/sources.list && apt update && apt install sudo
```
4. Next step is to [install](https://github.com/ElaXan/GCAndroid#install)

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

### Script
Copy this command and paste it into Termux:
[ONLY ONE TIME]
```bash
bash <(curl -s https://raw.githubusercontent.com/Score-Inc/GCAndroid/main/install.sh)
```
* If you want use that again just enter this command:
```bash
gcandroid
```

## Edit Mongodb Database
If you want to edit mongodb database, you can use [this app](https://play.google.com/store/apps/details?id=com.mongolime.app)\
If you don't have money to buy the app, you can search for other apks or search for the cracked version of the app that exists in the Internet...

Make sure MongoDB is running using this command
```bash
sudo service mongodb start
```
1. Open the application
2. Press/click on "New Connection"\
<img src="img/databaseEdit1.png" width="350"/><br />
3. You can enter/put name "Grasscutter" like in the photo\
<img src="img/databaseEdit2.png" width="350"/><br />\
Don't change anything unless you want to change the Mongodb port. Make sure to save it.
4. Click on "Grasscutter"\
<img src="img/databaseEdit3.png" width="350"/><br />
5. Done, now you can edit the Database

## Play
### Chinese APK
You need to use Termux for this or make your own Private DNS to redirect to localhost\
And dont ask me idk\
You can play without Private DNS or Termux, but it needs Root/SuperUser permissions\
And dont ask me how to root, go to [XDA](https://www.xda-developers.com/)

### Termux/mitmproxy
You can use [my script](https://github.com/Score-Inc/AnimeGamePatch)\
Select Menu on mitmproxy by running command `zex 4`\
<img src="img/termux.png" width="350"/><br />
