#!/bin/bash

# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

# Permissions of this strong copyleft license are conditioned
# on making available complete source code of licensed works
# and modifications, which include larger works using a licensed work,
# under the same license.
# Copyright and license notices must be preserved.
# Contributors provide an express grant of patent rights.

sudo apt update
isThisAndroid=$(uname -o)
if [[ $isThisAndroid = "Android" ]]; then
    clear
    echo "Please install on Ubuntu not Termux!"
    exit 2
fi

if [ -f "/bin/gcandroid" ]; then
    sudo rm /bin/gcandroid
fi

if [ -d "/usr/share/gcandroid" ]; then
    sudo rm -rf "/usr/share/gcandroid"
fi

folderName="GCAndroid"
if ! command -v git &> /dev/null; then
    sudo apt install git -y
fi
clear
echo "Download Script..."
sleep 1s
if [ -d "$folderName" ]; then
    rm -rf "$folderName"
fi
git clone https://github.com/ElaXan/GCAndroid.git
if [[ ! -d "$folderName" ]]; then
    echo "Install Failed!"
    exit 1
fi
cd $folderName
sudo mv Code/gcandroid.sh /bin/gcandroid
sudo chmod +x /bin/gcandroid
if [ -d "/usr/share/gcandroid" ]; then
    sudo rm -rf "/usr/share/gcandroid"
fi
sudo mv gcandroid /usr/share
sudo chmod +x /usr/share/gcandroid/*
rm -rf $HOME/$folderName
if [ -f "/bin/gcandroid" ] || [ -d "/usr/share/gcandroid" ]; then
    clear
    echo "Install Success!!"
    echo "now enter command : gcandroid"
else
    clear
    echo "Install Failed!"
fi
