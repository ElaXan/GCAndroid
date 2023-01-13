update() {
    isThisAndroid=$(uname -o)
    if [[ $isThisAndroid = "GNU/Linux" ]]; then
        clear
        echo "Please update on Termux Environment not on Linux Environment\nSee Github GCAndroid for more information"
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
    if [ -d "$folderName" ]; then
        rm -rf "$folderName"
    fi
    if [ ! -d "$HOME/.ElaXan" ]; then
        mkdir $HOME/.ElaXan
    fi
    cd $HOME/.ElaXan || exit 1
    git clone https://github.com/Score-Inc/GCAndroid.git
    if [[ $? != 0 ]]; then
        echo "Install Failed!"
        exit 1
    fi
    ln -sv $HOME/.ElaXan/$folderName/Code/gcandroid.sh $PREFIX/bin/gcandroid
    if [ -f "$PREFIX/bin/gcandroid" ] && [ -d "$HOME/.ElaXan/GCAndroid" ]; then
        clear
        echo "Update Success!!"
        echo "now enter command : gcandroid"
        exit
    else
        clear
        echo "Update Failed!"
        exit
    fi
}
