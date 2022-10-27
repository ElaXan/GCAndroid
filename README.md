<p align="center">
    <img src="gif/20221026_150902.gif" alt="gif animated" width="450" height="100">
</p>


# GCAndroid
What can do if I host a localhost server?
* Low ping
* You can edit the code (Banner, eveny, abyss, etc.)
* And more!
## Note
This needs [Ubuntu](https://ubuntu.com), [Termux](https://termux.dev/en/) and `SKILL`. And this burns your phone, so it's not recommended for low-end devices.\
But, who knows, maybe you can run it... XD

## Download
Download [Termux F-Droid](https://f-droid.org/repo/com.termux_118.apk) [RECOMMENDED]\
OR\
Download [Termux Android 12+](https://github.com/HardcodedCat/termux-monet) (NEEDS ROOT OR ADB)

## Setup
1. Enter this command to install proot-distro/ubuntu
```bash
pkg update -y && pkg install proot-distro -y && proot-distro install ubuntu
```
2. Login or enter Ubuntu mode with this command:
```bash
proot-distro login ubuntu
```
3. Now enter this command so that you can install MongoDB:
```bash
apts=$(cat /etc/apt/sources.list); echo -e "$apts\ndeb http://ports.ubuntu.com/ubuntu-ports/ focal main restricted\ndeb http://ports.ubuntu.com/ubuntu-ports/ focal-updates main restricted\ndeb http://ports.ubuntu.com/ubuntu-ports/ focal universe" > /etc/apt/sources.list && apt update && apt install sudo
```
4. Now, the next step is to [install](https://github.com/ElaXan/GCAndroid#install)



## Install
### MongoDB
If you already [setup](https://github.com/Score-Inc/GCAndroid#setup) you must now install MongoDB
Copy this and paste it to Termux:
```bash
sudo apt-get update -y && sudo apt-get install mongodb curl -y
```
After you have succesfully installed mongodb, run it using this command:
```bash
sudo service mongodb start
```
If want to stop this, paste this to Termux:
```bash
pkill mongo && sudo service mongodb stop
```

### Grasscutter
moved to [Script](https://github.com/Score-Inc/GCAndroid#script)

### Script
Copy this and paste it Termux
[ONLY ONE TIME!!]
```bash
bash <(curl -s https://raw.githubusercontent.com/Score-Inc/GCAndroid/main/install.sh)
```
* If you want use it again, just enter this command:
```bash
gcandroid
```

## Edit the MongoDB Database
If you want to edit the mongodb database, you can use [this app](https://play.google.com/store/apps/details?id=com.mongolime.app)\
If you don't have money to buy the app, you can search for other apks, or search for a cracked version of the app that exists in the Internet...

Make sure MongoDB is running with this command
```bash
sudo service mongodb start
```
1. Open the app
2. Press/click on "New Connection"\
<img src="img/databaseEdit1.png" width="350"/><br />
3. You can set the name to "Grasscutter" like in this photo:\
<img src="img/databaseEdit2.png" width="350"/><br />\
Don't change anything unless youre going to change the MongoDB Port. Then save the connection.
4. Click on "Grasscutter" (or whatever you set the name to)\
<img src="img/databaseEdit3.png" width="350"/><br />
5. Done! Now you can edit the Database


## Playing 
### Chinese APK
You need to use Termux for this. Or make your own Private DNS to redirect to localhost\
And dont ask me idk how\
You can play without Private DNS or Termux, but it needs Root/SuperUser permission/access\
And do not ask me how to root, go to [XDA Developers](https://www.xda-developers.com/)


### Termux/mitmproxy
You can use [my script](https://github.com/Score-Inc/AnimeGamePatch). To change it, enter `3`\
<img src="img/termuxsss.png" width="350"/><br />
Or you can manually edit it with:\
`nano proxy_config.py`\
Change `REMOTE_HOST` to **127.0.0.1**\
Change `REMOTE_PORT` to **54321**
