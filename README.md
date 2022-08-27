# GCAndroid
What can do if Localhost?
* Lowest Ping
* Can edit the Code (Banner, Event, Abyss, and etc)
* Much you can do
## Note
This need [Ubuntu](https://ubuntu.com), [Termux](https://termux.dev/en/) and `Skillssss`. And this burdens your phone, so it's not recommended for low specs\
But, why not to try it... May i wrong XD

## Download
Download [Termux F-Droid](https://f-droid.org/repo/com.termux_118.apk) [RECOMMEND]

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
Q. How to edit mongodb database??\
A. You can using Visual Studio Code for edit database\
Copy this and paste to Termux
```bash
wget https://az764295.vo.msecnd.net/stable/e4503b30fc78200f846c62cf8091b76ff5547662/code_1.70.2-1660628199_arm64.deb && sudo apt install libsecret-1-0 && sudo dpkg -i code_1.70.2-1660628199_arm64.deb && sudo sed -i "s/code --unity-launch %F/code --no-sandbox --unity-launch %F/g" /usr/share/applications/code.desktop
```
* Enter command `vncserver` on Termux then open [VNCViewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android)
* Click on "+" bottom right
* Enter Address : **localhost:5901**
* Name : || whatever you want ||
* Enter password when you install [Ubuntu](https://github.com/ElaXan/GCAndroid#setup)
1. Click on Application on Top Left
2. Open Visual Studio Code\
<img src="img/step_1.jpg" width="350"/><br />
3. Go to extension and search `mongodb`\
<img src="img/step_2.jpg" width="350"/><br />
4. `install` mongodb\
<img src="img/step_3.jpg" width="350"/><br />
5. Close `Visual Studio Code` and open it again same like number 1<br />
6. Click `mongodb icon` on bottom extension\
<img src="img/step_4.jpg" width="350"/><br />
7. Just click it and Done now you can edit Database `mongodb`\
<img src="img/step_5.jpg" width="350"/><br />
[YOU NEED TO TURN ON OR RUN `MONGODB` FOR CONNECT TO VISUAL STUDIO CODE]

## Play
### YuukiProxy
Enter address : `https://127.0.0.1:54321` like this picture\
<img src="img/yuukiproxy.jpg" width="350"/><br />
Then click `Custom Server`

### Termux/mitmproxy
You can using [my script](https://github.com/ElaXan/AnimeGamePatch) for change it enter number `3`\
<img src="img/termuxsss.png" width="350"/><br />
Or you can manual edit with\
`nano proxy_config.py`\
Change in `REMOTE_HOST` to **127.0.0.1**\
Change in `REMOTE_PORT` to **54321**
