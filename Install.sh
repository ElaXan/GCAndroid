#!/data/data/com.termux/files/usr/bin/bash

# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

apt update
isThisAndroid=$(uname -o)
if [[ $isThisAndroid = "GNU/Linux" ]]; then
    clear
    echo "Please install on Termux Environment not on Linux Environment"
    exit 2
fi

if [ -f "$PREFIX/bin/gcandroid" ]; then
    rm $PREFIX/bin/gcandroid
fi

if [ -d "$HOME/.ElaXan/GCAndroid" ]; then
    rm -rf "$HOME/.ElaXan/GCAndroid"
fi

folderName="GCAndroid"
if ! command -v git &> /dev/null; then
    apt install git -y
fi
clear
echo "Download Script..."
sleep 1s
if [ ! -d "$HOME/.ElaXan" ]; then
    mkdir $HOME/.ElaXan
fi

if [ -d "$HOME/.ElaXan/$folderName" ]; then
    rm -rf "$HOME/.ElaXan/$folderName"
fi

cd $HOME/.ElaXan
git clone https://github.com/Score-Inc/GCAndroid.git
if [[ ! -d "$folderName" ]]; then
    echo "Install Failed!"
    exit 1
fi
cd $folderName
ln -sv $HOME/.ElaXan/$folderName/Code/gcandroid.sh $PREFIX/bin/gcandroid
if [ -f "$PREFIX/bin/gcandroid" ] && [ -d "$HOME/.ElaXan/GCAndroid" ]; then
    clear
    echo "Install Success!!"
    echo "now enter command : gcandroid"
else
    clear
    echo "Install Failed!"
fi
