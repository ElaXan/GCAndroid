@echo off
cd ..
ssh Termux -- rm -rf $HOME/.ElaXan
ssh Termux -- mkdir $HOME/.ElaXan
scp -r GCAndroid Termux:~/.ElaXan/GCAndroid
ssh Termux -- ln -sv $HOME/.ElaXan/GCAndroid/Code/gcandroid.sh $PREFIX/bin/gcandroid
ssh Termux -- chmod +x $PREFIX/bin/gcandroid
ssh Termux -- bash $HOME/.ElaXan/GCAndroid/dos2unix.sh
pause
