#!/bin/bash

# Simple script no Main Menu :D
redColorBold="$(printf '\033[1;31m')"
isThisLinux=$(uname -o)
if [ $isThisLinux = Android ]; then
    echo "${redColorBold}Please run on Ubuntu/Linux not Termux!${whiteColor}"
    exit 2
fi
clear
echo "Install Java JDK 17"
sleep 1s
sudo apt install openjdk-17-jdk -y
clear
echo "Download Grasscutter and Resources"
if [ -f "$HOME/zGrasscutter.zip" ]; then
    rm zGrasscutter.zip
fi
if [ -f "$HOME/zResources.zip" ]; then
    rm zResources.zip
fi
sleep 1s
cd $HOME || exit
sudo apt install curl unzip -y
wget https://github.com/Grasscutters/Grasscutter/archive/refs/heads/development.zip -O zGrasscutter.zip
echo "unzip Grasscutter..."
sleep 1s
unzip zGrasscutter.zip
echo "Rename Grasscutter..."
mv Grasscutter-development Grasscutter
echo "Download Resources..."
sleep 1s
wget https://github.com/Koko-boya/Grasscutter_Resources/archive/refs/heads/2.8.zip -O zResources.zip
echo "unzip Resources [PLEASE WAIT!]"
sleep 1s
unzip zResources.zip
clear
echo "Move Resources to Grasscutter"
sleep 1s
mv $HOME/Grasscutter_Resources-2.8/Resources $HOME/Grasscutter/resources
rm -rf $HOME/Grasscutter_Resources-2.8
rm $HOME/zGrasscutter.zip
rm $HOME/zResources.zip
cd $HOME/Grasscutter
clear
echo "Compile jar (Please Wait)"
sleep 1s
./gradlew jar
mv grasscutter*.jar grasscutter.jar
timeout --foreground 3s java -jar grasscutter.jar
clear
echo "Edit Port..."
sed -i "s/\"bindPort\": 443/\"bindPort\": 54321/g" config.json
sleep 1s
echo "Done Set All"
echo "Address : 127.0.0.1"
echo "Port : 54321"
