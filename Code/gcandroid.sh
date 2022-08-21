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
        maxPlayer=$(cat "$configpath" | grep "\"maxPlayer\":" | sed "s/.*\"maxPlayer\": //g")
    fi

    if [ $1 = "joinOptions" ]; then
        welcomeMessage=$(cat "$configpath" | grep "\"welcomeMessage\":" | sed -e "s/.*: \"//g" -e "s/\"//g" -e "s/,//g")
    fi

    if [ $1 = "joinOptions_welcomeMail" ]; then
        welcomeMail_title=$(cat "$configpath" | grep "\"title\":" | sed -e "s/.*\"title\": //g" -e "s/\"//g" -e "s/,//g")
        welcomeMail_content=$(cat "$configpath" | grep "\"content\"" | sed -e "s/.*\"content\": \"//g" -e "s/\",//g")
        welcomeMail_sender=$(cat "$configpath" | grep "\"sender\":" | sed -e "s/.*\"sender\": \"//g" -e "s/\",//g")
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

        TRmaxPlayer=${GC}$maxPlayer${WC}
        
    fi

    if [ $1 = "joinOptionsl" ]; then
        TRwelcomeMessage=$welcomeMessage
    fi

    if [ $1 = "joinOptions_welcomeMail" ]; then
        TRwelcomeMail=$welcomeMail
        TRwelcomeMail_content=$welcomeMail_content
        TRwelcomeMail_sender=$welcomeMail_sender
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

        if [ $enterInputEditGrass = "3" ]; then
            EDfuncedit="\"maxPlayer\":"
            EDconfjson="$maxPlayer"
            echo -n "Enter amount maxPlayer : "
            read -r editCfgFunc_input
            if [ $editCfgFunc_input = $maxPlayer ]; then
                echo -e "${RC}Failed edit\n${YC}Reason${WC} : Same amount"
                echo -n "Press enter for back to Menu Config!"
                read
                menu_config_account
            else
                EDconfjsonTo="$editCfgFunc_input"
            fi
        fi
    fi

    if [ $1 = "joinOptions" ]; then
        if [ $enterInputEditGrass = "1" ]; then
            menu_detect_false_true "joinOptions"
            clear
            credit_hah
            echo "${GC}Current welcomeMessage :${WC}"
            echo "${CCB}$welcomeMessage${WC}"
            echo 
            echo "${YC}Enter a/A for Help"
            echo "Enter b/B for back or cancel${WC}"
            echo 
            echo "Enter custom welcomeMessage :${CCB}"
            read editCfgFunc_input
            echo -n ${WC}
            if [[ $editCfgFunc_input = "b" ]] || [[ $editCfgFunc_input = "B" ]]; then
                menu_config_game_joinOptions
            elif [[ $editCfgFunc_input = "a" ]] || [[ $editCfgFunc_input = "A" ]]; then
                menu_config_game_help_back="joinOptions"
                menu_config_game_help
            elif [[ $editCfgFunc_input = "" ]]; then
                echo "${RC}Please enter custom welcomeMessage!${WC}"
                sleep 1s
                editCfgFunc "joinOptions"
            fi
            if [[ $welcomeMessage = $editCfgFunc_input ]]; then
                echo -e "${RC}Failed Edit${YC}\nReason${WC} : Same welcomeMessage"
                echo -n "Press enter for try again"
                read
                editCfgFunc "joinOptions"
                return
            fi
            EDfuncedit="\"welcomeMessage\":"
            EDconfjson="\"$welcomeMessage\""
            EDconfjsonTo="\"$editCfgFunc_input\""
        fi
    fi
        
    if [ $1 = "joinOptions_welcomeMail" ]; then
        if [ $enterInputEditGrass = "1" ]; then
            menu_detect_false_true "joinOptions_welcomeMail"
            clear
            credit_hah
            echo "${GC}Current title :${CCB}"
            echo "$welcomeMail_title"
            echo
            echo "${YC}Enter a/A for Help"
            echo "Enter b/B for back or cancel${WC}"
            echo 
            echo "Enter custom title :${CCB}"
            read editCfgFunc_input
            echo -n "${WC}"
            if [[ $editCfgFunc_input = "b" ]] || [[ $editCfgFunc_input = "B" ]]; then
                menu_config_game_joinOptions_welcomeMail
            elif [[ $editCfgFunc_input = "a" ]] || [[ $editCfgFunc_input = "A" ]]; then
                menu_config_game_help_back="welcomeMail"
                menu_config_game_help
            elif [[ $editCfgFunc_input = "" ]]; then
                echo "${RC}Please enter custom title!${WC}"
                sleep 1s
                editCfgFunc "joinOptions_welcomeMail"
            fi
            if [[ $welcomeMail_title = $editCfgFunc_input ]]; then
                echo -e "${RC}Failed Edit${YC}\nReason${WC} : Same title"
                echo -n "Press enter for try again"
                read
                editCfgFunc "joinOptions_welcomeMail"
                return
            fi
            EDfuncedit="\"title\":"
            EDconfjson="\"$welcomeMail_title\""
            EDconfjsonTo="\"$editCfgFunc_input\""
        fi

        if [ $enterInputEditGrass = "2" ]; then
            menu_detect_false_true "joinOptions_welcomeMail"
            clear
            credit_hah
            echo "${GC}Current content :${CCB}"
            echo "$welcomeMail_content"
            echo
            echo "${YC}Enter a/A for Help"
            echo "Enter b/B for back or cancel${WC}"
            echo 
            echo "Enter custom content :${CCB}"
            read -r editCfgFunc_input
            echo -n "${WC}"
            if [[ $editCfgFunc_input = "b" ]] || [[ $editCfgFunc_input = "B" ]]; then
                menu_config_game_joinOptions_welcomeMail
            elif [[ $editCfgFunc_input = "a" ]] || [[ $editCfgFunc_input = "A" ]]; then
                menu_config_game_help_back="welcomeMail"
                menu_config_game_help
            elif [[ $editCfgFunc_input = "" ]]; then
                echo "${RC}Please enter custom content!${WC}"
                sleep 1s
                editCfgFunc "joinOptions_welcomeMail"
            fi
            if [[ $welcomeMail_content = $editCfgFunc_input ]]; then
                echo -e "${RC}Failed Edit${YC}\nReason${WC} : Same content"
                echo -n "Press enter for try again"
                read
                editCfgFunc "joinOptions_welcomeMail"
                return
            fi
            EDfuncedit="\"content\":"
            EDconfjson="\".*\""
            EDconfjsonTo="\"$editCfgFunc_input\""
        fi

        if [ $enterInputEditGrass = "3" ]; then
            menu_detect_false_true "joinOptions_welcomeMail"
            clear
            credit_hah
            echo "${GC}Current sender :${CCB}"
            echo "$welcomeMail_sender"
            echo
            echo "${YC}Enter b/B for back or cancel${WC}"
            echo 
            echo -n "Enter custom sender :${CCB} "
            read -r editCfgFunc_input
            echo -n "${WC}"
            if [[ $editCfgFunc_input = "b" ]] || [[ $editCfgFunc_input = "B" ]]; then
                menu_config_game_joinOptions_welcomeMail
            elif [[ $editCfgFunc_input = "" ]]; then
                echo "${RC}Please enter custom sender!${WC}"
                sleep 1s
                editCfgFunc "joinOptions_welcomeMail"
            fi
            if [[ $welcomeMail_sender = $editCfgFunc_input ]]; then
                echo -e "${RC}Failed Edit${YC}\nReason${WC} : Same sender"
                echo -n "Press enter for try again"
                read
                editCfgFunc "joinOptions_welcomeMail"
                return
            fi
            EDfuncedit="\"sender\":"
            EDconfjson="\".*\""
            EDconfjsonTo="\"$editCfgFunc_input\""
        fi
   fi
            

    sed -i "s/$EDfuncedit $EDconfjson/$EDfuncedit $EDconfjsonTo/" $configpath
    if [ $menu_config_back = "game" ]; then
        menu_config_game
    elif [ $menu_config_back = "account" ]; then
        menu_config_account
    elif [ $menu_config_back = "joinOptions" ]; then
        editCfgFunc "joinOptions"
    elif [ $menu_config_back = "joinOptions_welcomeMail" ]; then
        editCfgFunc "joinOptions_welcomeMail"
    fi
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

menu_config_account() {
    menu_config_back="account"
    credit_hah
    menu_detect_false_true "account"
    echo "1. [${TRautoCreate}] autoCreate"
    echo "2. [${TREXPERIMENTAL_RealPassword}] EXPERIMENTAL_RealPassword"
    echo "3. [${TRmaxPlayer}] maxPlayer"
    echo "0. Back"
    echo -n "Enter input : "
    read -r editConfJsonInp
    case $editConfJsonInp in
        "1" | "2" | "3" ) editCfgFunc "account";;
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

Install_Grasscutter_process() {
    credit_hah
    cd $HOME || exit 1
    echo "${GC}Install Java JDK 17${WC}"
    sleep 1s
    sudo apt install openjdk-17-jdk -y &> /dev/null
    if [ -d "$HOME/Grasscutter" ]; then
        rm -rf $HOME/Grasscutter
    fi
    sleep 1s
    cd $HOME || exit
    if ! command -v git &> /dev/null; then
        echo "${GC}Install unzip...${WC}"
        sudo apt install unzip -y &> /dev/null
    fi
    echo "${GC}Download Grasscutter and Resources${WC}"
    git clone https://github.com/Grasscutters/Grasscutter
    echo "${GC}Download Resources...${WC}"
    sleep 1s
    git clone https://github.com/Koko-boya/Grasscutter_Resources
    echo "${GC}Move Resources to Grasscutter${WC}"
    sleep 1s
    mv $HOME/Grasscutter_Resources/Resources $HOME/Grasscutter/resources
    rm -rf $HOME/Grasscutter_Resources
    cd $HOME/Grasscutter
    clear
    echo "${GC}Compile jar (Please Wait)${WC}"
    ./gradlew jar
    mv grasscutter*.jar grasscutter.jar
    timeout --foreground 5s java -jar grasscutter.jar &> /dev/null
    clear
    echo "${GC}Edit Port...${WC}"
    sed -i "s/\"bindPort\": 443/\"bindPort\": 54321/g" config.json
    sleep 1s
    echo "${GC}Done Set All"
    echo "Address : 127.0.0.1"
    echo "Port : 54321${WC}"
    echo ""
    echo -n "Press enter for back to Menu!"
    read
    main_menu
}

Install_Grasscutter_yes() {
    if [ -d "$HOME/Grasscutter-backup" ]; then
        echo "${RC}Can't do backup${YC}"
        echo "Because${WC} : $HOME/Grasscutter-backup exist"
        echo "${CCB}Remove manual for backup folder${WC}"
        echo
        echo -n "Press enter for continue remove Grasscutter folder and Install"
        read
        Install_Grasscutter_process
    else
        mv $HOME/Grasscutter $HOME/Grasscutter-backup
        Install_Grasscutter_process
    fi
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
        Install_Grasscutter_process
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
versionScript="2"
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
