#!/bin/bash

greenColorBold="$(printf '\033[1;32m')"
redColorBold="$(printf '\033[1;31m')"
yellowColorBold="$(printf '\033[1;33m')"
cyanColorBold="$(printf '\033[1;36m')"
whiteColor="$(printf '\033[0;37m')"
yellowColor="$(printf '\033[0;33m')"

configpath=$HOME/Grasscutter/config.json
wherethegrassss=$HOME/Grasscutter/grasscutter.jar
isThisLinux=$(uname -o)
if [ $isThisLinux = Android ]; then
    echo "${redColorBold}Please run on Ubuntu not Termux!${whiteColor}"
    exit 2
fi

credit_hah() {
    clear
    echo "=============================="
    echo "${greenColorBold}Script made by ElaXan${whiteColor}"
    echo "=============================="
}

changePort() {
    credit_hah
    if [ ! -f $configpath ]; then
        echo "${redColorBold}Error : config.json not found!${whiteColor}"
        echo -n "Press enter for back to Menu!"
        read
        main_menu
        return
    fi
    checkPort=$(cat $configpath | grep "\"bindPort\":" | head -n 1 | sed -e "s/.*\": //g" -e "s/,//g")
    echo "${cyanColorBold}Current Port : ${checkPort}${whiteColor}"
    echo "=============================="
    echo "Enter b/B for back or cancel"
    echo -n "Enter port : "
    read -r PortChange
    if [ $PortChange = "b" ] || [ $PortChange = "B" ]; then
        main_menu
        return
    fi
    if [ $PortChange = "22102" ]; then
        echo "${redColorBold}Please don't use port 22102${whiteColor}"
        echo "Press enter for try again!"
        read
        changePort
        return
    fi
    sed -i "s/\"bindPort\": $checkPort/\"bindPort\": $PortChange/g" $configpath
    echo "${greenColorBold}Port changed to $PortChange${whiteColor}"
    echo -n "Press enter for back to Menu!"
    read
    main_menu
}


GoToTouchGrass() {
    credit_hah
    if ! command -v mongo &> /dev/null; then
        echo "${redColorBold}Please install mongodb First!"
    fi
    pkill mongo
    sudo service mongodb start
    if [[ ! -f $wherethegrassss ]]; then
        echo "${redColorBold}Error : grasscutter.jar not found!${whiteColor}"
        echo -n "Press enter for back to Menu!"
        read -r
        main_menu
        return
    else
        cd $HOME/Grasscutter
        java -jar $HOME/Grasscutter/grasscutter.jar
    fi
}

EditGrass() {
    if ! command -v micro &> /dev/null; then
        sudo apt install micro
    fi
    micro $configpath
    main_menu
    return
}

installMongodb() {
    credit_hah
    if command -v mongo &> /dev/null; then
        echo "${yellowColorBold}Mongodb already installed"
        echo "Do you want reinstall?${whiteColor}"
        echo -n "Enter input (y/N) : "
        read mongodbAsk
        case $mongodbAsk in
            "y" | "Y" ) sudo apt reinstall mongodb; main_menu;;
            "n" | "N" ) main_menu;;
            "" ) sudo apt reinstall mongodb; main_menu;;
            * ) echo "Wrong Input!"; installMongodb;;
        esac
    else
        sudo apt install mongodb
    fi
}

main_menu() {
    credit_hah
    echo "${cyanColorBold}1. Run Grasscutter"
    echo "2. Edit config.json"
    echo "3. Change Port"
    echo "4. Install Mongodb"
    echo "0. ${redColorBold}Exit${whiteColor}"
    echo -n "Enter input : "
    read -r inputmain
    case $inputmain in
        "1" ) GoToTouchGrass;;
        "2" ) EditGrass;;
        "3" ) changePort;;
        "4" ) installMongodb;;
        "0" ) exit 0;;
        * ) echo "${redColorBold}Wrong Input!${whiteColor}"; sleep 1s; main_menu;;
    esac
}

main_menu
