#!/bin/bash

GC="$(printf '\033[1;32m')"
RC="$(printf '\033[1;31m')"
YC="$(printf '\033[1;33m')"
CCB="$(printf '\033[1;36m')"
CCU="$(printf '\033[4;36m')"
WC="$(printf '\033[0;37m')"

GCAndroid=/usr/share/gcandroid

if [ -f "$GCAndroid/changePort.sh" ]; then
    source $GCAndroid/changePort.sh
else
    echo "${RC}Error${WC} : $GCAndroid/changePort.sh not found"
fi
if [ -f "$GCAndroid/editConfigjson.sh" ]; then
    source $GCAndroid/editConfigjson.sh
else
    echo "${RC}Error${WC} : $GCAndroid/editConfigjson.sh not found"
fi
if [ -f "$GCAndroid/installGrasscutter.sh" ]; then
    source $GCAndroid/installGrasscutter.sh
else
    echo "${RC}Error${WC} : $GCAndroid/installGrasscutter.sh not found"
fi
if [ -f "$GCAndroid/menuFalseTrue.sh" ]; then
    source $GCAndroid/menuFalseTrue.sh
else
    echo "${RC}Error${WC} : $GCAndroid/menuFalseTrue.sh not found"
fi
if [ -f "$GCAndroid/runGrasscutter.sh" ]; then
    source $GCAndroid/runGrasscutter.sh
else
    echo "${RC}Error${WC} : $GCAndroid/runGrasscutter.sh not found"
fi

configpath=$HOME/Grasscutter/config.json
wherethegrassss=$HOME/Grasscutter/grasscutter.jar
inpscript=$1
isThisLinux=$(uname -o)
if [ $isThisLinux = Android ]; then
    echo "${RC}Please run on Ubuntu not Termux!${WC}"
    exit 2
fi

if ! command -v perl &> /dev/null; then
    sudo apt install perl
fi


credit_hah() {
    clear
    echo "====================================="
    echo "${GC}       Script made by ElaXan${WC}"
    echo "====================================="
    echo -e "$note_credit"
    echo "${CCU}https://github.com/ElaXan/GCAndroid${WC}"
    echo "====================================="
}

menu_config_game() {
    menu_config_back="game"
    credit_hah
    menu_detect_false_true "game"
    echo "1. [${TRenableShopItems}] enableShopItems"
    echo "2. [${TRenergyUsage}] energyUsage"
    echo "3. [${TRenableScriptInBigWorld}] enableScriptInBigWorld"
    echo "4. [${TRenableConsole}] enableConsole"
    echo "5. [${TRstaminaUsage}] staminaUsage"
    echo "6. [${TRwatchGachaConfig}] watchGachaConfig"
    echo "7. ${CCB}joinOptions${WC}"
    echo "0. Back"
    echo -n "Enter input : "
    read -r editConfJsonInp
    case $editConfJsonInp in
        "1" | "2" | "3" | "4" | "5" | "6" ) editCfgFunc "game";;
        "7" ) menu_config_game_joinOptions;;
        "0" ) menu_config;;
        * ) echo "${RC}Wrong Input!${WC}"; sleep 1s; menu_config_game;;
    esac
}

menu_config_game_joinOptions() {
    menu_config_back="joinOptions"
    credit_hah
    menu_detect_false_true "joinOptions"
    echo "${CCB}1. welcomeMessage"
    echo "2. welcomeMail"
    echo "0. ${RC}Back${WC}"
    echo -n "Enter input : "
    read -r editConfJsonInp
    case $editConfJsonInp in
        "1" ) editCfgFunc "joinOptions";;
        "2" ) menu_config_game_joinOptions_welcomeMail;;
        "0" ) menu_config;;
        * ) echo "${RC}Wrong Input!${WC}"; sleep 1s; menu_config_game_joinOptions;;
    esac
}

menu_config_game_help() {
    menu_config_back="joinOptions_welcomeMail"
    credit_hah
    menu_detect_false_true "joinOptions_welcomeMail"
    echo "${YC}Use "'\\n'" for newline not "'\n'
    echo "Example ${WC}:${CCB}Welcome to ElaXan Server"'\\n'"Thanks for join my Server"
    echo
    echo "${YC}if you want use https:// or / thing please use "'\'
    echo "Example ${WC}:${CCB} "'https:\/\/github.com\/ElaXan\/GCAndroid'"${WC}"
    echo
    echo -n "Press enter for back to edit $menu_config_game_help_back"
    read
    if [[ $menu_config_game_help_back = "joinOptions" ]]; then
        editCfgFunc "joinOptions"
    elif [[ $menu_config_game_help_back = "welcomeMail" ]]; then
        editCfgFunc "joinOptions_welcomeMail"
    fi
}

menu_config_game_joinOptions_welcomeMail() {
    menu_config_back="joinOptions_welcomeMail"
    credit_hah
    menu_detect_false_true "joinOptions_welcomeMail"
    echo "${CCB}1. title"
    echo "2. content"
    echo "3. sender"
    echo "0. ${RC}Back${WC}"
    echo -n "Enter Input : "
    read -r editConfJsonInp
    case $editConfJsonInp in
        "1" | "2" | "3" ) editCfgFunc "joinOptions_welcomeMail";;
        "0" ) menu_config_game_joinOptions;;
        * ) echo "${RC}Wrong Input!${WC}"; sleep 1s; menu_config_game_joinOptions_welcomeMail;;
    esac
}

menu_config_account_defaultPermissions() {
    credit_hah
}

menu_config_account() {
    menu_config_back="account"
    credit_hah
    menu_detect_false_true "account"
    echo "1. [${TRautoCreate}] autoCreate"
    echo "2. [${TREXPERIMENTAL_RealPassword}] EXPERIMENTAL_RealPassword"
    echo "3. [${TRmaxPlayer}] maxPlayer"
    echo "4. ${CCB}defaultPermissions${WC}"
    echo "0. ${RC}Back${WC}"
    echo -n "Enter input : "
    read -r editConfJsonInp
    case $editConfJsonInp in
        "1" | "2" | "3" ) editCfgFunc "account";;
        "4" ) echo "${YC}Still development...${WC}"; sleep 1s; menu_config_account;;
        "0" ) menu_config;;
        * ) echo "${RC}Wrong Input!${WC}"; sleep 1s; menu_config_account;;
    esac
}

menu_config_editManual() {
    if ! command -v micro &> /dev/null; then
        sudo apt install micro -y
    fi
    echo "${GC}Press CTRL + Q on your keyboard for exit${WC}"
    sleep 2s
    micro $configpath
    menu_config
}

menu_config() {
    if [ ! -f $configpath ]; then
        credit_hah
        echo "${RC}Error${WC} : $configpath not found!"
        echo 
        echo -n "Press enter for back to Menu!"
        read
        main_menu
        return
    fi
    credit_hah
    echo "${CCB}1. Account"
    echo "2. Game"
    echo "3. Edit Manual"
    echo "0. ${RC}Back${WC}"
    echo -n "Enter input : "
    read menu_config_input
    case $menu_config_input in
        "1" ) menu_config_account;;
        "2" ) menu_config_game;;
        "3" ) menu_config_editManual;;
        "0" ) main_menu;;
        * ) echo "${RC}Wrong Input!${WC}"; sleep 1s; menu_config;;
    esac
}

installMongodb() {
    credit_hah
    if command -v mongo &> /dev/null; then
        echo "${yellowColorBold}Mongodb already installed"
        echo "Do you want reinstall?${WC}"
        echo -n "Enter input (y/N) : "
        read mongodbAsk
        case $mongodbAsk in
            "y" | "Y" ) sudo apt reinstall mongodb; main_menu;;
            "n" | "N" ) main_menu;;
            "" ) sudo apt reinstall mongodb; main_menu;;
            * ) echo "Wrong Input!"; sleep 1s; installMongodb;;
        esac
    else
        sudo apt install mongodb
    fi
}

Install_Grasscutter_yes() {
    if [ -d "$HOME/Grasscutter-backup" ]; then
        credit_hah
        echo "${RC}Can't do backup${YC}"
        echo "Because${WC} : $HOME/Grasscutter-backup exist"
        echo "${CCB}Remove manual for backup folder${WC}"
        echo
        echo -n "Press enter for continue remove Grasscutter folder and Install"
        read
        Install_Grasscutter_option
    else
        credit_hah
        echo "${GC}Backup Grasscutter...${WC}"
        mv $HOME/Grasscutter $HOME/Grasscutter-backup
        echo "${GC}Done...Now Install${WC}"
        sleep 1s
        Install_Grasscutter_option
    fi
}

Install_Grasscutter_option() {
    credit_hah
    echo "${GC}Please choose this for download Resources${WC}"
    echo "${YC}1. Koko-Boya Resources"
    echo "2. Yuuki Resources"
    echo "0. ${RC}Back/Cancel${WC}"
    echo
    echo -n "Enter input : ${CCB}"
    read Install_Grasscutter_option_input
    case $Install_Grasscutter_option_input in
        "1" ) Install_Grasscutter_Resources="Koko-Boya"; Install_Grasscutter_process;;
        "2" ) Install_Grasscutter_Resources="Yuuki"; Install_Grasscutter_process;;
        "0" ) main_menu;;
        * ) echo "${RC}Wrong input!${WC}"; sleep 1s; Install_Grasscutter_option;;
    esac
}

Install_Grasscutter() {
    credit_hah
    if [ -d "$HOME/Grasscutter" ]; then
        echo "${RC}Grasscutter already installed${WC}"
        echo
        echo "${YC}Do you want reinstall?${WC}"
        echo -n "Enter input (y/N) : "
        read Install_Grasscutter_input
        case $Install_Grasscutter_input in
            "y" | "Y" ) Install_Grasscutter_yes;;
            "n" | "N" ) main_menu;;
            * ) echo "${RC}Wrong Input!${WC}"; sleep 0.5s; Install_Grasscutter;;
        esac
    else
        Install_Grasscutter_yes
    fi
}

main_menu() {
    credit_hah
    echo "${CCB}1. Run Grasscutter"
    echo "2. Install Grasscutter"
    echo "3. Edit config.json"
    echo "4. Change Port"
    echo "5. Install Mongodb"
    echo "0. ${RC}Exit${WC}"
    echo -n "Enter input : "
    read -r inputmain
    case $inputmain in
        "1" ) GoTouchGrass;;
        "2" ) Install_Grasscutter;;
        "3" ) menu_config;;
        "4" ) changePort;;
        "5" ) installMongodb;;
        "0" ) clear; exit 0;;
        * ) echo "${RC}Wrong Input!${WC}"; sleep 1s; main_menu;;
    esac
}

newVersionScript=""
source <(curl -s https://raw.githubusercontent.com/ElaXan/GCAndroid/main/updateinfo)
versionScript="2.1.1"
if [[ $newVersionScript = "" ]]; then
    clear
    note_credit="${RC}Can't connect to Server${WC}"
    echo "$note_credit"
    echo
    echo "Press enter for continue!"
    main_menu
    return
elif [[ $versionScript < $newVersionScript ]]; then
    clear
    echo "There is update to Version : $newVersionScript"
    echo "New Update : "
    echo -e "$noteUpdate"
    echo -n "Enter input (y/N) : "
    read -r update_input
    case $update_input in
        "y" | "Y" ) update; return;;
        "n" | "N" ) note_credit="${YC}New Version : ${GC}$newVersionScript${YC}\nCurrent Version : ${RC}$versionScript${WC}"; main_menu;;
        * ) echo "${RC}Wrong input!${WC}"; exit 1;;
    esac
elif [[ $versionScript = $newVersionScript ]]; then
    note_credit="$noteLatestVersion"
fi
        
case $inpscript in
    "1" ) GoTouchGrass;;
    "2" ) EditGrass;;
    "3" ) changePort;;
    "4" ) installMongodb;;
    * ) main_menu
esac
