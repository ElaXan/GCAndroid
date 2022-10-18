#!/bin/bash

GC="$(printf '\033[1;32m')"
RC="$(printf '\033[1;31m')"
YC="$(printf '\033[1;33m')"
CCB="$(printf '\033[1;36m')"
CCU="$(printf '\033[4;36m')"
WC="$(printf '\033[0;37m')"

isThisLinux=$(uname -o)
if [ $isThisLinux = Android ]; then
    echo "${RC}Please run on Ubuntu not Termux!${WC}"
    exit 2
fi

GCAndroid=/usr/share/gcandroid

if [ -f "$GCAndroid/changePort.sh" ]; then
    source $GCAndroid/changePort.sh
else
    echo "${RC}Error${WC} : $GCAndroid/changePort.sh not found"
    exit 1
fi
if [ -f "$GCAndroid/editConfigjson.sh" ]; then
    source $GCAndroid/editConfigjson.sh
else
    echo "${RC}Error${WC} : $GCAndroid/editConfigjson.sh not found"
    exit 1
fi
if [ -f "$GCAndroid/installGrasscutter.sh" ]; then
    source $GCAndroid/installGrasscutter.sh
else
    echo "${RC}Error${WC} : $GCAndroid/installGrasscutter.sh not found"
    exit 1
fi
if [ -f "$GCAndroid/menuFalseTrue.sh" ]; then
    source $GCAndroid/menuFalseTrue.sh
else
    echo "${RC}Error${WC} : $GCAndroid/menuFalseTrue.sh not found"
    exit 1
fi
if [ -f "$GCAndroid/runGrasscutter.sh" ]; then
    source $GCAndroid/runGrasscutter.sh
else
    echo "${RC}Error${WC} : $GCAndroid/runGrasscutter.sh not found"
    exit 1
fi
if [ -f "$GCAndroid/spin.sh" ]; then
    source $GCAndroid/spin.sh
else
    echo "${RC}Error${WC} : $GCAndroid/spin.sh not found"
    exit 1
fi
if [ -f "$GCAndroid/installPlugin.sh" ]; then
    source $GCAndroid/installPlugin.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/installPlugin.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/removePlugin.sh" ]; then
    source $GCAndroid/removePlugin.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/removePlugin.sh not found!"
    exit 1
fi

configpath=$HOME/Grasscutter/config.json
wherethegrassss=$HOME/Grasscutter/grasscutter.jar
inpscript=$1

if ! command -v perl &>/dev/null; then
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
    echo "${GC}Contact me at chat@elaxan.com${WC}"
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
    "1" | "2" | "3" | "4" | "5" | "6") editCfgFunc "game" ;;
    "7") menu_config_game_joinOptions ;;
    "0") menu_config ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 1s
        menu_config_game
        ;;
    esac
}

menu_config_game_joinOptions() {
    menu_config_back="joinOptions"
    credit_hah
    menu_detect_false_true "joinOptions"
    echo "1. ${CCB}welcomeMessage${WC}"
    echo "2. ${CCB}welcomeMail${WC}"
    echo "0. ${RC}Back${WC}"
    echo -n "Enter input : "
    read -r editConfJsonInp
    case $editConfJsonInp in
    "1") editCfgFunc "joinOptions" ;;
    "2") menu_config_game_joinOptions_welcomeMail ;;
    "0") menu_config ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 1s
        menu_config_game_joinOptions
        ;;
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
    echo "1. ${CCB}title${WC}"
    echo "2. ${CCB}content${WC}"
    echo "3. ${CCB}sender${WC}"
    echo "0. ${RC}Back${WC}"
    echo -n "Enter Input : "
    read -r editConfJsonInp
    case $editConfJsonInp in
    "1" | "2" | "3") editCfgFunc "joinOptions_welcomeMail" ;;
    "0") menu_config_game_joinOptions ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 1s
        menu_config_game_joinOptions_welcomeMail
        ;;
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
    echo "0. ${RC}Back${WC}"
    echo -n "Enter input : "
    read -r editConfJsonInp
    case $editConfJsonInp in
    "1" | "2" | "3") editCfgFunc "account" ;;
    "0") menu_config ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 1s
        menu_config_account
        ;;
    esac
}

menu_config_editManual() {
    if ! command -v micro &>/dev/null; then
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
    echo "1. ${CCB}Account${WC}"
    echo "2. ${CCB}Game${WC}"
    echo "3. ${CCB}Edit Manual${WC}"
    echo "0. ${RC}Back${WC}"
    echo -n "Enter input : "
    read menu_config_input
    case $menu_config_input in
    "1") menu_config_account ;;
    "2") menu_config_game ;;
    "3") menu_config_editManual ;;
    "0") main_menu ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 1s
        menu_config
        ;;
    esac
}

installMongodb() {
    credit_hah
    if command -v mongo &>/dev/null; then
        echo "${RC}Mongodb already installed"
        echo "${YC}Do you want reinstall?${WC}"
        echo -n "Enter input (y/N) : "
        read mongodbAsk
        case $mongodbAsk in
        "y" | "Y")
            sudo apt reinstall mongodb
            main_menu
            ;;
        "n" | "N") main_menu ;;
        "")
            sudo apt reinstall mongodb
            main_menu
            ;;
        *)
            echo "Wrong Input!"
            sleep 1s
            installMongodb
            ;;
        esac
    else
        sudo apt install mongodb
        credit_hah
        if ! command -v mongo &>/dev/null; then
            echo "${RC}Mongodb failed to install!${WC}"
        else
            echo "${GC}Mongodb success installed!${WC}"
        fi
        echo
        echo -n "Press enter for back to Main Menu!"
        read
        main_menu
    fi
}

Install_Grasscutter_option() {
    credit_hah
    echo "${GC}Please choose this for download Resources${WC}"
    echo "1. ${YC}tamilpp25 Resources${WC}"
    echo "2. ${YC}Yuuki Resources (RECOMMEND)${WC}"
    echo "0. ${RC}Back/Cancel${WC}"
    echo
    echo -n "Enter input : ${CCB}"
    read Install_Grasscutter_option_input
    echo -n "${WC}"
    case $Install_Grasscutter_option_input in
    "1")
        Install_Grasscutter_Resources="tamilpp25"
        Install_Grasscutter_process
        ;;
    "2")
        Install_Grasscutter_Resources="Yuuki"
        Install_Grasscutter_process
        ;;
    "0") main_menu ;;
    *)
        echo "${RC}Wrong input!${WC}"
        sleep 1s
        Install_Grasscutter_option
        ;;
    esac
}

Install_Grasscutter() {
    credit_hah
    if [ -d "$HOME/Grasscutter" ]; then
        echo "${RC}Grasscutter already installed${WC}"
        echo
        echo "${YC}Do you want reinstall?${WC}"
        echo -n "Enter input (y/N) : ${CCB}"
        read Install_Grasscutter_input
        echo -n "${WC}"
        case $Install_Grasscutter_input in
        "y" | "Y") Install_Grasscutter_option ;;
        "n" | "N") main_menu ;;
        *)
            echo "${RC}Wrong Input!${WC}"
            sleep 0.5s
            Install_Grasscutter
            ;;
        esac
    else
        Install_Grasscutter_option
    fi
}

main_menu() {
    credit_hah
    echo "1. ${CCB}Run Grasscutter${WC}"
    echo "2. ${CCB}Install Grasscutter${WC}"
    echo "3. ${CCB}Edit config.json${WC}"
    echo "4. ${CCB}Install Plugin${WC}"
    echo "5. ${CCB}Remove Plugin${WC}"
    echo "6. ${CCB}Change Port${WC}"
    echo "7. ${CCB}Install Mongodb${WC}"
    echo "0. ${RC}Exit${WC}"
    echo -n "Enter input : "
    read -r inputmain
    case $inputmain in
    "1") GoTouchGrass ;;
    "2") Install_Grasscutter ;;
    "3") menu_config ;;
    "4") installPlugin ;;
    "5") removePlugin ;;
    "6") changePort ;;
    "7") installMongodb ;;
    "0")
        clear
        exit 0
        ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 1s
        main_menu
        ;;
    esac
}

newVersionScript=""
source <(curl -s https://raw.githubusercontent.com/ElaXan/GCAndroid/main/updateinfo)
versionScript="2.4.5"
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
    "y" | "Y")
        update
        return
        ;;
    "n" | "N")
        note_credit="${YC}New Version : ${GC}$newVersionScript${YC}\nCurrent Version : ${RC}$versionScript${WC}"
        main_menu
        ;;
    *)
        echo "${RC}Wrong input!${WC}"
        exit 1
        ;;
    esac
elif [[ $versionScript = $newVersionScript ]]; then
    note_credit="$noteLatestVersion"
fi

case $inpscript in
"1") GoTouchGrass ;;
"2") Install_Grasscutter ;;
"3") menu_config ;;
"4") installPlugin ;;
"5") removePlugin ;;
"6") changePort ;;
"7") installMongodb ;;
*) main_menu ;;
esac
