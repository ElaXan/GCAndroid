#!/bin/bash

greenColorBold="$(printf '\033[1;32m')"
redColorBold="$(printf '\033[1;31m')"
yellowColorBold="$(printf '\033[1;33m')"
cyanColorBold="$(printf '\033[1;36m')"
whiteColor="$(printf '\033[0;37m')"
yellowColor="$(printf '\033[0;33m')"

configpath=$HOME/Grasscutter/config.json
wherethegrassss=$HOME/Grasscutter/grasscutter.jar

credit_hah()
    clear
    echo "===================="
    echo "${greenColorBold}Script made by ElaXan${whiteColor}"
    echo "===================="
}


GoToTouchGrass() {
    credit_hah
    pkill mongo
    sudo service mongodb start
    if [[ ! -f $wherethegrassss ]]; then
        echo "${redColorBold}Error : grasscutter.jar not found!${whiteColor}"
        echo -n "Press enter for back to Menu!"
        read -r
        main_menu
        return
    else
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

main_menu() {
    credit_hah
    echo "${cyanColorBold}1. Run Grasscutter
    echo "2. Edit config.json"
    echo "3. ${redColorBold}Exit${whiteColor}"
    echo -n "Enter input : "
    read -r inputmain
    case $inputmain in
        "1" ) GoToTouchGrass;;
        "2" ) EditGrass;;
        "3" ) exit 0;;
        * ) echo "${redColorBold}Wrong Input!${whiteColor}"; sleep 1s; main_menu;;
    esac
}

main_menu