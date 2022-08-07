#!/bin/bash

# Simple script no Main Menu :D
clear
echo "Install Java JDK 17"
sleep 1s
sudo apt install openjdk-17-jdk -y
clear
echo "Download Grasscutter and Resources"
sleep 1s
cd $HOME || exit
sudo apt install curl git -y
git clone https://github.com/Grasscutters/Grasscutter.git
git clone https://github.com/Koko-boya/Grasscutter_Resources
clear
echo "Move Resources to Grasscutter"
sleep 1s
mv $HOME/Grasscutter_Resources/Resources $HOME/Grasscutter/resources
rm -rf $HOME/Grasscutter_Resources
cd $HOME/Grasscutter
clear
echo "Compile jar (Please Wait)"
sleep 1s
./gradlew jar
