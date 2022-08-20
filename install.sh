#!/bin/bash

sudo apt update
isThisAndroid=$(uname -o)
if [[ $isThisAndroid = "Android" ]]; then
    clear
    echo "Please install on Ubuntu not Termux!"
    exit 2
fi

if [ -f "/bin/gcandroid" ]; then
    rm /bin/gcandroid
fi

folderName="zexInstall"
mkdir $HOME/$folderName
cd $HOME/$folderName
if ! command -v wget &> /dev/null; then
    sudo apt install wget
fi
echo "Download Script..."
sleep 1s
wget https://raw.githubusercontent.com/ElaXan/GCAndroid/main/Code/gcandroid.sh &> /dev/null
if [[ ! -f "gcandroid.sh" ]]; then
    echo "Install Failed!"
    exit 1
fi
mv gcandroid.sh /bin/gcandroid
chmod +x /bin/gcandroid
rm -rf $HOME/$folderName
if [ -f "/bin/gcandroid" ]; then
    clear
    echo "Install Success!!"
    echo "now enter command : gcandroid"
else
    clear
    echo "Install Failed!"
fi
