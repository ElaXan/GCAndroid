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
line="====================================="
line0() {
    echo "${GC}$1${WC}"
    echo "${line}"
}

line1() {
    echo "${GC} $1${WC}"
    echo "${line}"
}

line2() {
    echo "${GC}  $1${WC}"
    echo "${line}"
}

line3() {
    echo "${GC}   $1${WC}"
    echo "${line}"
}

line4() {
    echo "${GC}    $1${WC}"
    echo "${line}"
}

line5() {
    echo "${GC}     $1${WC}"
    echo "${line}"
}

line6() {
    echo "${GC}      $1${WC}"
    echo "${line}"
}

line7() {
    echo "${GC}       $1${WC}"
    echo "${line}"
}

line8() {
    echo "${GC}        $1${WC}"
    echo "${line}"
}

line9() {
    echo "${GC}         $1${WC}"
    echo "${line}"
}

line10() {
    echo "${GC}          $1${WC}"
    echo "${line}"
}

line11() {
    echo "${GC}           $1${WC}"
    echo "${line}"
}

line12() {
    echo "${GC}            $1${WC}"
    echo "${line}"
}

line13() {
    echo "${GC}             $1${WC}"
    echo "${line}"
}

line14() {
    echo "${GC}              $1${WC}"
    echo "${line}"
}

line15() {
    echo "${GC}               $1${WC}"
    echo "${line}"
}

if [ -f "$GCAndroid/loadOtherShellScript.sh" ]; then
    source $GCAndroid/loadOtherShellScript.sh
else
    echo "${RC}Error${WC} : $GCAndroid/loadOtherShellScript.sh not found!"
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

clear
echo -n "${WC}"
echo $line
line8 "Script made by ElaXan"
line15 "LOADING"
echo "${CCU}https://github.com/Score-Inc/GCAndroid${WC}"
echo $line
echo "${GC}Contact me at chat@elaxan.com${WC}"
echo $line

loadOtherShellScript

credit_hah() {
    clear
    echo -n "${WC}"
    echo $line
    line8 "Project owner by ElaXan"
    echo -e "$note_credit"
    echo "${CCU}https://github.com/Score-Inc/GCAndroid${WC}"
    echo $line
    echo "${GC}      Join our Discord Server!${WC}"
    echo "${CCU}https://discord.gg/discord.gg/2TTSUZZ${WC}"
    echo $line
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
    echo "1. ${CCB}Edit using this Script${WC}"
    echo "2. ${CCB}Edit Manual${WC}"
    echo "3. ${CCB}Change Port${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read menu_config_input
    case $menu_config_input in
    "1") edit_configjson ;;
    "2") menu_config_editManual ;;
    "3") changePort ;;
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
    echo "2. ${CCB}Edit Banners.json${WC}"
    echo "3. ${CCB}Install Plugin${WC}"
    echo "4. ${CCB}Remove Plugin${WC}"
    echo "5. ${CCB}Get GM Handbook${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r Grasscutter_Tools_Input
    case $Grasscutter_Tools_Input in
    "1") menu_config ;;
    "2") Edit_Banners ;;
    "3") installPlugin ;;
    "4") removePlugin ;;
    "5") generateHandbook ;;
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
    echo "0. ${RC}Exit${WC}"
    echo
    echo -n "Enter input : "
    read -r inputmain
    case $inputmain in
    "1") GoTouchGrass ;;
    "2") Grasscutter_Menu ;;
    "3") Grasscutter_Tools ;;
    "4") InstallMenu ;;
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
versionScript="2.7"
echo -en "\033[2K\r${GC}Load${WC} : ${CCB}getInfoUpdate [FROM SERVER]${WC}";
source <(curl -s https://raw.githubusercontent.com/Score-Inc/GCAndroid/Server/getInfoUpdate)
echo -en "\033[2K\r${GC}Load${WC} : ${CCB}updateScript.sh [FROM SERVER]${WC}";
source <(curl -s https://raw.githubusercontent.com/Score-Inc/GCAndroid/Server/updateScript.sh)
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
