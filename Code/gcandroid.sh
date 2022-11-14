#!/bin/bash

# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

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

if [ -f "$GCAndroid/compileGrasscutter.sh" ]; then
    source $GCAndroid/compileGrasscutter.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/compileGrasscutter.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/descriptionMenu.sh" ]; then
    source $GCAndroid/descriptionMenu.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/descriptionMenu.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/generateHandbook.sh" ]; then
    source $GCAndroid/generateHandbook.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/generateHandbook.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/editConfigJson.sh" ]; then
    source $GCAndroid/editConfigJson.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/editConfigJson.sh not found"
    exit 1
fi

if [ -f "$GCAndroid/getConfigjson.sh" ]; then
    source $GCAndroid/getConfigjson.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/getConfigjson.sh not found"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/Server.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/Server.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/Server.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/logcommands.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/logcommands.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/logcommands.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/runMode.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/runMode.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/runMode.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/Http.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/http/Http.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/Http.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/bindAddress.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/http/bindAddress.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/bindAddress.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/accessAddress.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/http/accessAddress.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/accessAddress.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/accessPort.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/http/accessPort.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/accessPort.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/encryption/encryption.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/http/encryption/encryption.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/encryption/encryption.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/encryption/useEncryption.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/http/encryption/useEncryption.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/encryption/useEncryption.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/encryption/useInRouting.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/http/encryption/useInRouting.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/encryption/useInRouting.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/encryption/keystore.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/http/encryption/keystore.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/encryption/keystore.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/encryption/keystorePassword.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/http/encryption/keystorePassword.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/encryption/keystorePassword.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/policies/policies.sh" ]; then
    source $GCAndroid//Edit_Config_Json/Server/http/policies/policies.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/policies/policies.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/policies/cors/cors.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/http/policies/cors/cors.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/policies/cors/cors.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/policies/cors/enabled.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/http/policies/cors/enabled.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/policies/cors/enabled.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/policies/cores/cores.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/http/policies/cores/cores.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/policies/cores/cores.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/policies/cores/enbaled.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/http/policies/cores/enbaled.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/policies/cores/enbaled.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/policies/cores/enabled.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/http/policies/cores/enabled.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/policies/cores/enabled.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/files/files.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/http/files/files.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/files/files.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/files/indexFile.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/http/files/indexFile.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}Edit_Config_Json/Server/http/files/indexFile.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/http/files/errorFile.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/http/files/errorFile.sh
else
    echo "${GC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/files/errorFile.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/game/game.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/game/game.sh
else
    echo "${GC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/game.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/game/bindAddress.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/game/bindAddress.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/bindAddress.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/game/bindPort.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/game/bindPort.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/bindPort.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/game/accessAddress.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/game/accessAddress.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/accessAddress.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/game/accessPort.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/game/accessPort.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/accessPort.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/game/loadEntitiesForPlayerRange.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/game/loadEntitiesForPlayerRange.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/loadEntitiesForPlayerRange.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/game/enableScriptInBigWorld.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/game/enableScriptInBigWorld.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/enableScriptInBigWorld.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/game/enableConsole.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/game/enableConsole.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/enableConsole.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/game/kcpInterval.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/game/kcpInterval.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/kcpInterval.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/game/logPackets.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/game/logPackets.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/logPackets.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/game/isShowPacketPayload.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/game/isShowPacketPayload.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/isShowPacketPayload.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/game/isShowLoopPackets.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/game/isShowLoopPackets.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/isShowLoopPackets.sh not found!"
    exit 1
fi

if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/gameOptions.sh" ]; then
    source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/gameOptions.sh
else
    echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/gameOptions.sh not found!"
    exit 1
fi

configpath=$HOME/Grasscutter/config.json
wherethegrassss=$HOME/Grasscutter/grasscutter.jar
inpscript=$1

if ! command -v perl &>/dev/null; then
    sudo apt install perl
fi

if ! command -v wget &>/dev/null; then
    sudo apt install wget -y
fi

if ! command -v jq &>/dev/null; then
    sudo apt install jq -y
fi

credit_hah() {
    clear
    echo -n "${WC}"
    echo $line
    line8 "Script made by ElaXan"
    echo "$note_credit"
    echo "${CCU}https://github.com/Score-Inc/GCAndroid${WC}"
    echo $line
    echo "${GC}Contact me at chat@elaxan.com${WC}"
    echo $line
}

menu_config_game() {
    menu_config_back="game"
    credit_hah
    # Done Center
    line10 "Menu Config Game"
    menu_detect_false_true "game"
    echo "1. [${TRenableShopItems}] enableShopItems"
    echo "2. [${TRenergyUsage}] energyUsage"
    echo "3. [${TRenableScriptInBigWorld}] enableScriptInBigWorld"
    echo "4. [${TRenableConsole}] enableConsole"
    echo "5. [${TRstaminaUsage}] staminaUsage"
    echo "6. [${TRwatchGachaConfig}] watchGachaConfig"
    echo "7. ${CCB}joinOptions${WC}"
    echo "8. ${CCB}serverAccount${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r editConfJsonInp
    case $editConfJsonInp in
    "1" | "2" | "3" | "4" | "5" | "6") editCfgFunc "game" ;;
    "7") menu_config_game_joinOptions ;;
    "8") menu_config_game_serverAccount ;;
    "0") menu_config ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 1s
        menu_config_game
        ;;
    esac
}

menu_config_game_serverAccount() {
    menu_config_back="serverAccount"
    credit_hah
    line3 "Menu Config Game serverAccount"
    echo "1. ${GC}avatarId${WC}"
    echo "2. ${GC}nameCardId${WC}"
    echo "3. ${GC}adventureRank${WC}"
    echo "4. ${GC}worldLevel${WC}"
    echo "5. ${GC}nickName${WC}"
    echo "6. ${GC}signature${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r editConfJsonInp
    case $editConfJsonInp in
    "1" | "2" | "3" | "4" | "5" | "6") editCfgFunc "serverAccount" ;;
    "0") menu_config_game ;;
    *)
        echo "${RC}Wrong input!${WC}"
        sleep 1s
        menu_config_game_serverAccount
        ;;
    esac
}

menu_config_game_joinOptions() {
    menu_config_back="joinOptions"
    credit_hah
    # Done Center
    line4 "Menu Config Game Join Option"
    menu_detect_false_true "joinOptions"
    echo "1. ${CCB}welcomeMessage${WC}"
    echo "2. ${CCB}welcomeMail${WC}"
    echo "0. ${RC}Back${WC}"
    echo
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
    echo
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
    # Done Center
    line9 "Menu Config Account"
    menu_detect_false_true "account"
    echo "1. [${TRautoCreate}] autoCreate"
    echo "2. [${TREXPERIMENTAL_RealPassword}] EXPERIMENTAL_RealPassword"
    echo "3. [${TRmaxPlayer}] maxPlayer"
    echo "0. ${RC}Back${WC}"
    echo
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
    line10 "Edit config.json"
    echo "1. ${CCB}Account${WC}"
    echo "2. ${CCB}Game${WC}"
    echo "3. ${CCB}Edit Manual${WC}"
    echo "4. ${CCB}Change Port${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read menu_config_input
    case $menu_config_input in
    "1") menu_config_account ;;
    "2") menu_config_game ;;
    "3") menu_config_editManual ;;
    "4") changePort ;;
    "0") Grasscutter_Tools ;;
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
        echo
        echo -n "Enter input (y/N) : "
        read mongodbAsk
        case $mongodbAsk in
        "y" | "Y")
            credit_hah
            line10 "Mongodb Install"
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
    line0 "Please choose this for download Resources"
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
        echo
        echo -n "Enter input (y/N) : ${CCB}"
        read Install_Grasscutter_input
        echo -n "${WC}"
        case $Install_Grasscutter_input in
        "y" | "Y") Install_Grasscutter_option ;;
        "n" | "N") Grasscutter_Menu ;;
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

Grasscutter_Menu() {
    credit_hah
    line11 "Grascutter Menu"
    echo "1. ${CCB}Install Grasscutter${WC}"
    echo "2. ${CCB}Compile .jar${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r Grasscutter_Menu_Input
    case $Grasscutter_Menu_Input in
    "1") Install_Grasscutter ;;
    "2") Compile_Grasscutter ;;
    "0") main_menu ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 1s
        Grasscutter_Menu
        ;;
    esac
}

Grasscutter_Tools() {
    credit_hah
    # Done Center
    line10 "Grasscutter Tools"
    echo "1. ${CCB}Edit config.json${WC}"
    echo "2. ${CCB}Install Plugin${WC}"
    echo "3. ${CCB}Remove Plugin${WC}"
    echo "4. ${CCB}Get GM Handbook${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r Grasscutter_Tools_Input
    case $Grasscutter_Tools_Input in
    "1") menu_config ;;
    "2") installPlugin ;;
    "3") removePlugin ;;
    "4") generateHandbook ;;
    "0") main_menu ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 1s
        Grasscutter_Tools
        ;;
    esac
}

installJavaJDK17() {
    credit_hah
    line7 "Installing Java JDK 17"
    if (command -v java &>/dev/null); then
        echo "${YC}You already installed Java"
        echo "${YC}Want to reinstall?${WC}"
        echo
        echo -n "Enter input (y/N) : "
        read -r installJavaJDK17_input
        if [[ $installJavaJDK17_input = "n" ]] || [[ $installJavaJDK17_input = "N" ]]; then
            InstallMenu
        elif [[ $installJavaJDK17_input = "y" ]] || [[ $installJavaJDK17_input = "Y" ]]; then
            credit_hah
            line7 "Installing Java JDK 17"
            run_Program() {
                sudo apt reinstall openjdk-17-jdk -y &>$HOME/zerr.log
                errCode=$?
                log "$errCode"
            }
            run_Program &
            pid=$!
            spin "${GC}Install Java JDK 17${WC}" "0" "Install Menu" "InstallMenu"
        else
            echo "${RC}Wrong Input!${WC}"
            sleep 1s
            installJavaJDK17
        fi
    else
        run_Program() {
            sudo apt install openjdk-17-jdk -y &>$HOME/zerr.log
            errCode=$?
            log "$errCode"
        }
        run_Program &
        pid=$!
        spin "${GC}Install Java JDK 17${WC}" "0" "Install Menu" "InstallMenu"
    fi
    echo
    echo -n "Press enter for back to Install Menu!"
    read -r
    InstallMenu
}

InstallMenu() {
    credit_hah
    # Done Center
    line12 "Install Menu"
    echo "1. ${CCB}Install Mongodb${WC}"
    echo "2. ${CCB}Install Java JDK 17${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r InstallMenu_input
    case $InstallMenu_input in
    "1") installMongodb ;;
    "2") installJavaJDK17 ;;
    "0") main_menu ;;
    *)
        echo "${RC}Wrong input!${WC}"
        sleep 1s
        InstallMenu
        ;;
    esac
}

main_menu() {
    credit_hah
    # Done Center
    line14 "Main Menu"
    echo "1. ${CCB}Run Grasscutter${WC}"
    echo "2. ${CCB}Grasscutter Menu${WC}"
    echo "3. ${CCB}Grasscutter Tools${WC}"
    echo "4. ${CCB}Install Menu${WC}"
    echo "5. ${CCB}Edit config.json [TEST]${WC}"
    echo "0. ${RC}Exit${WC}"
    echo
    echo -n "Enter input : "
    read -r inputmain
    case $inputmain in
    "1") GoTouchGrass ;;
    "2") Grasscutter_Menu ;;
    "3") Grasscutter_Tools ;;
    "4") InstallMenu ;;
    "5") edit_configjson_Server_main ;;
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
source <(curl -s https://raw.githubusercontent.com/Score-Inc/GCAndroid/Server/getInfoUpdate)
source <(curl -s https://raw.githubusercontent.com/Score-Inc/GCAndroid/Server/updateScript.sh)
versionScript="2.6"
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
"6") installMongodb ;;
*) main_menu ;;
esac
