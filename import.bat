@echo off
cd ..
scp -r GCAndroid Termux:~/.ElaXan
ssh Termux -- ln -sv $HOME/.ElaXan/GCAndroid/Code/gcandroid.sh $PREFIX/bin/gcandroid
ssh Termux -- chmod +x $PREFIX/bin/gcandroid
ssh Termux -- bash $HOME/.ElaXan/GCAndroid/dos2unix.sh
pause
