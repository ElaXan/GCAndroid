#!/bin/bash

GC="$(printf '\033[1;32m')"
RC="$(printf '\033[1;31m')"
YC="$(printf '\033[1;33m')"
CCB="$(printf '\033[1;36m')"
CCU="$(printf '\033[4;36m')"
WC="$(printf '\033[0;37m')"

configpath=$HOME/Grasscutter/config.json
wherethegrassss=$HOME/Grasscutter/grasscutter.jar
inpscript=$1
isThisLinux=$(uname -o)
if [ $isThisLinux = Android ]; then
    echo "${RC}Please run on Ubuntu not Termux!${WC}"
    exit 2
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

GoTouchGrass() {
    credit_hah
    if ! command -v mongo &> /dev/null; then
        echo "${RC}Please install mongodb First!${WC}"
        echo 
        echo -n "Press enter for back to Menu!"
        read
        main_menu
        return
    fi
    pkill mongo
    sudo service mongodb start
    if [[ ! -f $wherethegrassss ]]; then
        echo "${RC}Error${WC} : $wherethegrassss not found!"
        echo -n "Press enter for back to Menu!"
        read -r
        main_menu
        return
    else
        cd $HOME/Grasscutter
        java -jar $HOME/Grasscutter/grasscutter.jar
    fi
}



menu_detect_false_true() {
    if [ $1 = "game" ]; then
        enableShopItems=$(cat "$configpath" | grep "\"enableShopItems\":" | sed -e "s/.*\"enableShopItems\": //g" -e "s/,//g")
        energyUsage=$(cat "$configpath" | grep "\"energyUsage\":" | sed -e "s/.*\"energyUsage\": //g" -e "s/,//g")
        enableScriptInBigWorld=$(cat "$configpath" | grep "\"enableScriptInBigWorld\":" | sed -e "s/.*\"enableScriptInBigWorld\": //g" -e "s/,//g")
        enableConsole=$(cat "$configpath" | grep "\"enableConsole\":" | sed -e "s/.*\"enableConsole\": //g" -e "s/,//g")
        staminaUsage=$(cat "$configpath" | grep "\"staminaUsage\":" | sed -e "s/.*\"staminaUsage\": //g" -e "s/,//g")
        watchGachaConfig=$(cat "$configpath" | grep "\"watchGachaConfig\":" | sed -e "s/.*\"watchGachaConfig\": //g" -e "s/,//g")
    fi

    if [ $1 = "account" ]; then
        autoCreate=$(cat "$configpath" | grep "\"autoCreate\":" | sed -e "s/.*\"autoCreate\": //g" -e "s/,//g")
        EXPERIMENTAL_RealPassword=$(cat "$configpath" | grep "\"EXPERIMENTAL_RealPassword\":" | sed -e "s/.*\"EXPERIMENTAL_RealPassword\": //g" -e "s/,//g")
    fi

    if [ $1 = "game" ]; then
        if [ $enableShopItems = true ]; then
            TRenableShopItems="${GC}True${WC}"
        elif [ $enableShopItems = false ]; then
            TRenableShopItems="${RC}False${WC}"
        fi

        if [ $energyUsage = true ]; then
            TRenergyUsage="${GC}True${WC}"
        elif [ $energyUsage = false ]; then
            TRenergyUsage="${RC}False${WC}"
        fi

        if [ $enableScriptInBigWorld = true ]; then
            TRenableScriptInBigWorld="${GC}True${WC}"
        elif [ $enableScriptInBigWorld = false ]; then
            TRenableScriptInBigWorld="${RC}False${WC}"
        fi

        if [ $enableConsole = true ]; then
            TRenableConsole="${GC}True${WC}"
        elif [ $enableConsole = false ]; then
            TRenableConsole="${RC}False${WC}"
        fi

        if [ $staminaUsage = true ]; then
            TRstaminaUsage="${GC}True${WC}"
        elif [ $staminaUsage = false ]; then
            TRstaminaUsage="${RC}False${WC}"
        fi

        if [ $watchGachaConfig = true ]; then
            TRwatchGachaConfig="${GC}True${WC}"
        elif [ $watchGachaConfig = false ]; then
            TRwatchGachaConfig="${RC}False${WC}"
        fi
    fi

    if [ $1 = "account" ]; then
        if [ $autoCreate = true ]; then
            TRautoCreate="${GC}True${WC}"
        elif [ $autoCreate = false ]; then
            TRautoCreate="${RC}False${WC}"
        fi

        if [ $EXPERIMENTAL_RealPassword = true ]; then
            TREXPERIMENTAL_RealPassword="${GC}True${WC}"
        elif [ $EXPERIMENTAL_RealPassword = false ]; then
            TREXPERIMENTAL_RealPassword="${RC}False${WC}"
        fi
    fi
}

editCfgFunc() {
    enterInputEditGrass=$editConfJsonInp
    if [ $1 = "game" ]; then
        if [ $enterInputEditGrass = "1" ]; then
            EDfuncedit="\"enableShopItems\":"
            if [ $enableShopItems = true ]; then
                EDconfjson="true"
                EDconfjsonTo="false"
            elif [ $enableShopItems = false ]; then
                EDconfjson="false"
                EDconfjsonTo="true"
            fi
        elif [ $enterInputEditGrass = "2" ]; then
            EDfuncedit="\"energyUsage\":"
            if [ $energyUsage = true ]; then
                EDconfjson="true"
                EDconfjsonTo="false"
            elif [ $energyUsage = false ]; then
                EDconfjson="false"
                EDconfjsonTo="true"
            fi
        elif [ $enterInputEditGrass = "3" ]; then
            EDfuncedit="\"enableScriptInBigWorld\":"
            if [ $enableScriptInBigWorld = true ]; then
                EDconfjson="true"
                EDconfjsonTo="false"
            elif [ $enableScriptInBigWorld = false ]; then
                EDconfjson="false"
                EDconfjsonTo="true"
            fi
        elif [ $enterInputEditGrass = "4" ]; then
            EDfuncedit="\"enableConsole\":"
            if [ $enableConsole = true ]; then
                EDconfjson="true"
                EDconfjsonTo="false"
            elif [ $enableConsole = false ]; then
                EDconfjson="false"
                EDconfjsonTo="true"
            fi
        elif [ $enterInputEditGrass = "5" ]; then
            EDfuncedit="\"staminaUsage\":"
            if [ $staminaUsage = true ]; then
                EDconfjson="true"
                EDconfjsonTo="false"
            elif [ $staminaUsage = false ]; then
                EDconfjson="false"
                EDconfjsonTo="true"
            fi
        elif [ $enterInputEditGrass = "6" ]; then
            EDfuncedit="\"watchGachaConfig\":"
            if [ $watchGachaConfig = true ]; then
                EDconfjson="true"
                EDconfjsonTo="false"
            elif [ $watchGachaConfig = false ]; then
                EDconfjson="false"
                EDconfjsonTo="true"
            fi
        fi
    fi

    if [ $1 = "account" ]; then
        if [ $enterInputEditGrass = "1" ]; then
            EDfuncedit="\"autoCreate\":"
            if [ $autoCreate = true ]; then
                EDconfjson="true"
                EDconfjsonTo="false"
            elif [ $autoCreate = false ]; then
                EDconfjson="false"
                EDconfjsonTo="true"
            fi
        fi

        if [ $enterInputEditGrass = "2" ]; then
            EDfuncedit="\"EXPERIMENTAL_RealPassword\":"
            if [ $EXPERIMENTAL_RealPassword = true ]; then
                EDconfjson="true"
                EDconfjsonTo="false"
            elif [ $EXPERIMENTAL_RealPassword = false ]; then
                EDconfjson="false"
                EDconfjsonTo="true"
            fi
        fi
    fi


    sed -i "s/$EDfuncedit $EDconfjson/$EDfuncedit $EDconfjsonTo/g" $configpath
    if [ $menu_config_back = "game" ]; then
        menu_config_game
    elif [ $menu_config_back = "account" ]; then
        menu_config_account
    fi
}

menu_config_game() {
    if [ ! -f $configpath ]; then
        credit_hah
        echo "${RC}Error${WC} : $configpath not found!"
        echo 
        echo -n "Press enter for back to Menu!"
        read
        main_menu
        return
    fi
    
    menu_config_back="game"
    credit_hah
    menu_detect_false_true "game"
    echo "1. [${TRenableShopItems}] enableShopItems"
    echo "2. [${TRenergyUsage}] energyUsage"
    echo "3. [${TRenableScriptInBigWorld}] enableScriptInBigWorld"
    echo "4. [${TRenableConsole}] enableConsole"
    echo "5. [${TRstaminaUsage}] staminaUsage"
    echo "6. [${TRwatchGachaConfig}] watchGachaConfig"
    echo "0. Back"
    echo -n "Enter input : "
    read -r editConfJsonInp
    case $editConfJsonInp in
        "1" | "2" | "3" | "4" | "5" | "6" ) editCfgFunc "game";;
        "0" ) menu_config;;
        * ) echo "Wrong Input!"; sleep 1s; EditGrass;;
    esac
}



menu_config_account() {
    menu_config_back="account"
    credit_hah
    menu_detect_false_true "account"
    echo "1. [${TRautoCreate}] autoCreate"
    echo "2. [${TREXPERIMENTAL_RealPassword}] EXPERIMENTAL_RealPassword"
    echo "0. Back"
    echo -n "Enter input : "
    read -r editConfJsonInp
    case $editConfJsonInp in
        "1" | "2" ) editCfgFunc "account";;
        "0" ) menu_config;;
        * ) echo "${RC}Wrong Input!${WC}"; sleep 1s; menu_config_account;;
    esac
}

menu_config() {
    credit_hah
    echo "${CCB}1. Account"
    echo "2. Game"
    echo "0. ${RC}Back${WC}"
    echo -n "Enter input : "
    read menu_config_input
    case $menu_config_input in
        "1" ) menu_config_account;;
        "2" ) menu_config_game;;
        "0" ) main_menu;;
        * ) echo "${RC}Wrong Input!${WC}"; sleep 1s; menu_config;;
    esac
}

changePort() {
    credit_hah
    if [ ! -f $configpath ]; then
        echo "${RC}Error${WC} : $configpath not found!"
        echo 
        echo -n "Press enter for back to Menu!"
        read
        main_menu
        return
    fi
    checkPort=$(cat $configpath | grep "\"bindPort\":" | head -n 1 | sed -e "s/.*\": //g" -e "s/,//g")
    echo "${CCB}Current Port : ${checkPort}${WC}"
    echo "====================================="
    echo "Enter b/B for back or cancel"
    echo -n "Enter port : "
    read -r PortChange
    if [[ $PortChange = "b" ]] || [[ $PortChange = "B" ]]; then
        main_menu
        return
    fi
    if [[ $PortChange = "22102" ]] || [[ $PortChange = "443" ]]; then
        echo "${RC}Please don't use port $PortChange${WC}"
        echo -n "Press enter for try again!"
        read
        changePort
        return
    fi
    if [[ $PortChange = "" ]]; then
        echo "${RC}Please enter Port!${WC}"
        echo
        echo -n "Press enter for try again!"
        read
        changePort
        return
    fi
    sed -i "s/\"bindPort\": $checkPort/\"bindPort\": $PortChange/g" $configpath
    echo "${GC}Port changed to $PortChange${WC}"
    echo -n "Press enter for back to Menu!"
    read
    main_menu
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

main_menu() {
    credit_hah
    echo "${CCB}1. Run Grasscutter"
    echo "2. Edit config.json"
    echo "3. Change Port"
    echo "4. Install Mongodb"
    echo "0. ${RC}Exit${WC}"
    echo -n "Enter input : "
    read -r inputmain
    case $inputmain in
        "1" ) GoTouchGrass;;
        "2" ) menu_config;;
        "3" ) changePort;;
        "4" ) installMongodb;;
        "0" ) clear; exit 0;;
        * ) echo "${RC}Wrong Input!${WC}"; sleep 1s; main_menu;;
    esac
}

source <(curl -s https://raw.githubusercontent.com/ElaXan/GCAndroid/main/updateinfo)
versionScript="1"
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
    echo "$noteUpdate"
    echo -n "Enter input (y/N) : "
    read -r update_input
    case $update_input in
        "y" | "Y" ) update; return;;
        "n" | "N" ) main_menu; note_credit="${YC}New Version : ${GC}$newVersionScript${YC}\nCurrent Version : ${RC}$versionScript${WC}";;
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
