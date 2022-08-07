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
Open [Andronix](https://play.google.com/store/apps/details?id=studio.com.techriz.andronix)
1. Select Ubuntu Icon
2. Click on "Proceed"
3. Select "20.04"
4. Select "Install"
5. Select "Desktop Environment"
6. Select "XFCE"
7. Click "Open Termux"
8. And paste on Termux then Enter on your Keyboard
* This need long time to install depends with your Internet
* Don't close or kill Termux, if you do that then some program/package not install
* If in Termux became like this `root@localhost:~#` then do [next step](https://github.com/ElaXan/GCAndroid#install)

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
sudo apt install curl -y && bash <(curl -s https://raw.githubusercontent.com/ElaXan/GCAndroid/main/Code/grasscutter_compile.sh)
```

### Script
Copy this and paste to Termux
[ONLY ONE TIME]
```bash
wget https://raw.githubusercontent.com/ElaXan/GCAndroid/main/Code/gcandroid.sh && bash gcandroid.sh
```
* If you want use that again just enter this command
```bash
bash gcandroid.sh
```

## Edit Mongodb Database
A. How to edit mongodb database??\
Q. You can using Visual Studio Code for edit database\
Copy this and paste to Termux
```bash
wget https://az764295.vo.msecnd.net/stable/da76f93349a72022ca4670c1b84860304616aaa2/code_1.70.0-1659587966_arm64.deb && sudo apt install libsecret-1-0 && dpkg -i code_1.70.0-1659587966_arm64.deb && sudo sed -i "s/code --unity-launch %F/code --no-sandbox --unity-launch %F/g" /usr/share/applications/code.desktop
```
* Enter command `vncserver` on Termux then open [VNCViewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android)
* Click on "+" bottom right
* Enter Address : **localhost:5901**
* Name : || whatever you want ||
* Enter password when you install [Ubuntu](https://github.com/ElaXan/GCAndroid#setup)
1. Open Visual Studio Code\
<img src="img/step_1.jpg" width="350"/><br />
2. Go to extension and search `mongodb`\
<img src="img/step_2.jpg" width="350"/><br />
3. `install` mongodb\
<img src="img/step_3.jpg" width="350"/><br />
4. Close `Visual Studio Code` and open it again same like number 1<br />
5. Click `mongodb icon` on bottom extension\
<img src="img/step_4.jpg" width="350"/><br />
6. Just click it and Done now you can edit Database `mongodb`\
<img src="img/step_5.jpg" width="350"/><br />
[YOU NEED TO TURN ON OR RUN `MONGODB` FOR CONNECT TO VISUAL STUDIO CODE]
