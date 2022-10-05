# GCAndroid
What can do if Localhost?
* Lowest Ping
* Can edit the Code (Banner, Event, Abyss, and etc)
* Much you can do
## Note
This need [Ubuntu](https://ubuntu.com), [Termux](https://termux.dev/en/) and `Skillssss`. And this burdens your phone, so it's not recommended for low specs\
But, why not to try it... May i wrong XD

## Download
Download [Termux F-Droid](https://f-droid.org/repo/com.termux_118.apk) [RECOMMEND]\
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
Install Grasscutter already moved to [Script](https://github.com/ElaXan/GCAndroid#script)

### Script
Copy this and paste to Termux
[ONLY ONE TIME]
```bash
bash <(curl -s https://raw.githubusercontent.com/ElaXan/GCAndroid/main/install.sh)
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
you need to use Termux for this or make your own Private DNS to redirect to localhost\
and dont ask me idk

### Termux/mitmproxy
You can using [my script](https://github.com/ElaXan/AnimeGamePatch) for change it enter number `3`\
<img src="img/termuxsss.png" width="350"/><br />
Or you can manual edit with\
`nano proxy_config.py`\
Change in `REMOTE_HOST` to **127.0.0.1**\
Change in `REMOTE_PORT` to **54321**
