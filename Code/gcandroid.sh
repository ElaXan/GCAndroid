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

Center_Text() {
    textss=$1

    lines=$(echo $line | wc -c)
    textss=$(echo $1 | wc -c)
    space=$((lines - textss))
    space=$((space / 2))
    space=$(printf "%${space}s")
    if [[ $2 == "link" ]]; then
        if [[ $3 == "Cyan" ]]; then
            echo "${space}${CCU}$1${WC}"
        fi
    else
        echo "${GC}${space}$1${WC}"
    fi
    echo $line
}

clear
echo -n "${WC}"
echo $line
Center_Text "Project Owner by ElaXan"
Center_Text "LOADING..."
echo "${CCU}https://github.com/Score-Inc/GCAndroid${WC}"
echo $line
echo "${GC}Contact me at chat@elaxan.com${WC}"
echo $line

credit_hah() {
    clear
    echo -n "${WC}"
    echo $line
    Center_Text "Project Owner by ElaXan"
    echo -e "$note_credit"
    echo $line
    echo "${CCU}https://github.com/Score-Inc/GCAndroid${WC}"
    echo $line
    echo "${GC}      Join our Discord Server!${WC}"
    Center_Text "https://discord.gg/2TTSUZZ" "link" "Cyan"
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

Reset_Config_Json() {
    credit_hah
    Center_Text "Reset config.json"
    if ! (command -v java &>/dev/null); then
        echo "${RC}Error${WC} : Java not found!"
        echo
        read -p "Press enter for back to Edit Config Json"
        menu_config
    fi
    if [ ! -f $wherethegrassss ]; then
        echo "${RC}Error${WC} : Grasscutter.jar not found!"
        echo
        read -p "Press enter for back to Edit Config Json"
        menu_config
    fi
    if [ ! -f $configpath ]; then
        echo "${RC}Error${WC} : config.json not found!"
        echo
        read -p "Press enter for back to Edit Config Json"
        menu_config
    fi
    echo "${RC}This will reset your config.json to default!${WC}"
    echo -n "${RC}Are you sure? [y/N] : ${WC}"
    read -r Reset_Config_Json_Input
    if [ $Reset_Config_Json_Input = y ]; then
        cd $HOME/Grasscutter || exit 1
        rm "config.json"
        Run "timeout --foreground 8s java -jar grasscutter.jar" "Resetting config.json" "124" "Main Config" "menu_config"
        echo "${YC}Enter custom port for Grasscutter${WC}"
        read -p "Port : " port
        if [ $port -lt 1024 ] || [ -z $port ]; then
            echo "${RC}Port must be higher than 1024!${WC}"
            echo "${GC}Port will be set to 54321${WC}"
            port=54321
        else
            echo "${GC}Port will be set to $port${WC}"
        fi
        echo
        echo "${YC}Enter custom folderStructure for Grasscutter${WC}"
        read -p "resources : " custom_resources
        if [ -z $custom_resources ]; then
            echo "${RC}resources cannot be empty!${WC}"
            echo "${GC}skip edit resources${WC}"
            custom_resources=""
        else
            echo "${GC}resources will be set to $custom_resources${WC}"
        fi
        if [ ! -f $configpath ]; then
            echo "${RC}Error${WC} : Failed to reset config.json!"
            echo
            read -p "Press enter for back to Edit Config Json"
            menu_config
        fi
        editJsonJqs() {
            jq "$1" $configpath >$HOME/temp.json
            mv $HOME/temp.json $configpath
        }
        editJsonJqs ".server.http.bindPort=$port"
        if [ ! -z $custom_resources ]; then
            editJsonJqs ".folderStructure.resources=\"$custom_resources\""
        fi

        editJsonJqs '.server.game.joinOptions.welcomeMessage="localhost on Android using GCAndroid\n\n\rhttps://github.com/Score-Inc/GCAndroid"'

        echo
        echo -n "Press enter for back to Edit Config Json"
        read -r
        menu_config
    else
        menu_config
    fi
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
    Center_Text "Edit config.json"
    echo "1. ${CCB}Edit using this Script${WC}"
    echo "2. ${CCB}Edit Manual${WC}"
    echo "3. ${CCB}Change Port${WC}"
    echo "4. ${CCB}Reset config.json${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read menu_config_input
    case $menu_config_input in
    "1") edit_configjson ;;
    "2") menu_config_editManual ;;
    "3") changePort ;;
    "4") Reset_Config_Json ;;
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
            Center_Text "Mongodb Install"
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
    Center_Text "Please choose this for download Resources"
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
        "y" | "Y")
            Grasscutter_Already_Installed=1
            Install_Grasscutter_option
            ;;
        "n" | "N") Grasscutter_Menu ;;
        *)
            echo "${RC}Wrong Input!${WC}"
            sleep 0.5s
            Install_Grasscutter
            ;;
        esac
    else
        Backup_Resources="0"
        Install_Grasscutter_option
    fi
}

Grasscutter_Menu() {
    credit_hah
    Center_Text "Grasscutter Menu"
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
    Center_Text "Grasscutter Tools"
    echo "1. ${CCB}Edit config.json${WC}"
    echo "2. ${CCB}Edit Banners.tsj${WC}"
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
    Center_Text "Install Java JDK 17"
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
            Center_Text "Installing Java JDK 17"
            Run "sudo apt reinstall openjdk-17-jdk -y" "Install Java JDK 17" "0" "Install Menu" "InstallMenu"
        else
            echo "${RC}Wrong Input!${WC}"
            sleep 1s
            installJavaJDK17
        fi
    else
        Run "sudo apt reinstall openjdk-17-jdk -y" "Install Java JDK 17" "0" "Install Menu" "InstallMenu"
    fi
    echo
    echo -n "Press enter for back to Install Menu!"
    read -r
    InstallMenu
}

InstallMenu() {
    credit_hah
    Center_Text "Install Menu"
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

license() {
    credit_hah
    Center_Text "License"
    echo "${GC}GNU General Public License v3.0${WC}"
    echo
    echo "This program is free software:"
    echo "you can redistribute it and/or modify"
    echo "it under the terms of the"
    echo "GNU General Public License as published by"
    echo "the Free Software Foundation,"
    echo "either version 3 of the License, or"
    echo "(at your option) any later version."
    echo
    echo "This program is distributed in the"
    echo "hope that it will be useful,"
    echo "but WITHOUT ANY WARRANTY; without even"
    echo "the implied warranty of"
    echo "MERCHANTABILITY or FITNESS FOR A"
    echo "PARTICULAR PURPOSE."
    echo "See theGNU General Public License"
    echo "for more details."
    echo
    echo "You should have received a copy of"
    echo "the GNU General Public License"
    echo "along with this program."
    echo "If not, see <https://www.gnu.org/licenses/>."
    echo
    echo -n "Press enter for back to About Us!"
    read -r
    about_us
}

credits() {
    credit_hah
    Center_Text "Credits"
    echo "${CCB}Creator :${WC} ${GC}ElaXan${WC}"
    echo "${CCB}Github :${WC} ${CCU}https://github.com/ElaXan${WC}"
    echo "${CCB}Telegram :${WC} ${CCU}https://t.me/ElashXander${WC}"
    echo "${CCB}Discord :${WC} ${CCU}https://discord.com/users/506212044152897546${WC}"
    echo
    echo -n "Press enter for back to About Us!"
    read -r
    about_us
}

about_us2() {
    credit_hah
    Center_Text "About Me"
    echo -e "${GC}I am an ordinary person who learns about programming.\nand I made this at will, without payment or free.\nso, if you buy this project or GCAndroid,\nPlease refund you got scam\n\n"
    echo "${CCB}Website Score-Inc: ${CCU}https://scoreps.xyz${WC}"
    echo "${CCB}Github: ${CCU}https://github.com/Score-Inc${WC}"
    echo
    echo -n "Press enter for back to About Us"
    read -r
    about_us
}

about_us() {
    credit_hah
    Center_Text "About Us"
    echo "1. ${CCB}About Me${WC}"
    echo "2. ${CCB}Credits${WC}"
    echo "3. ${CCB}License${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r about_us_input
    case $about_us_input in
    "1") about_us2 ;;
    "2") credits ;;
    "3") license ;;
    "0") main_menu ;;
    *)
        echo "${RC}Wrong input!${WC}"
        sleep 1s
        about_us
        ;;
    esac
}

how_to_setup() {
    credit_hah
    Center_Text "How to Setup"
    echo "${CCB}First you need to install ${GC}Mongodb${CCB}"
    echo "and ${GC}Java JDK 17${CCB} in ${GC}Install Menu${CCB}"
    echo "and then you can use ${GC}Grasscutter Menu${CCB}"
    echo "In Grasscutter Menu there is ${YC}2${CCB} options"
    echo "${WC}1. ${GC}Install Grasscutter"
    echo "${WC}2. ${GC}Compile .jar${CCB}"
    echo "If you want to install ${GC}Grasscutter${CCB}"
    echo "you can use ${GC}Install Grasscutter${CCB}"
    echo "and if you want to compile .jar"
    echo "you can use ${GC}Compile .jar${CCB}"
    echo "but you need to have ${YC}gradlew${CCB} first"
    echo "If not you cant use ${GC}Compile .jar${CCB}"
    echo "So now choose number ${GC}1${CCB}"
    echo
    echo "Then there is ${YC}2${CCB} options again"
    echo "${WC}1. ${GC}tamilpp25 Resources"
    echo "${WC}2. ${GC}Yuuki Resources${CCB}"
    echo "If you want to use ${GC}tamilpp25 Resources${CCB}"
    echo "you can select number ${GC}1${CCB}"
    echo "and if you want to use ${GC}Yuuki Resources${CCB}"
    echo "you can select number ${GC}2${CCB}"
    echo
    echo "Then there is ${YC}2${CCB} options again"
    echo "${WC}1. ${GC}Compile grasscutter.jar"
    echo "${WC}2. ${GC}Download grasscutter.jar${CCB}"
    echo "${YC}Compile grasscutter${CCB} mean you ${GC}can${CCB} modify ${YC}Banners${CCB}"
    echo "And other code for ${YC}grasscutter${CCB}"
    echo "${YC}Download grasscutter${CCB} mean you ${RC}cant${CCB} modify ${YC}Banners${CCB}"
    echo "And other code for ${YC}grasscutter${CCB}"
    echo "So if you want to modify ${YC}Banners${CCB}"
    echo "you can select number ${YC}1${CCB}"
    echo "and if you dont want to modify ${YC}Banners${CCB}"
    echo "you can select number ${YC}2${CCB}"
    echo
    echo "Then there is options for choose ${YC}version Resources${CCB}"
    echo "and you can choose ${YC}version Resources${CCB}"
    echo "As version AnimeGame you have."
    echo "if ${YC}3.2${CCB} then you can choose ${YC}3.2${CCB}"
    echo
    echo "Now installing grasscutter"
    echo
    echo "If you see ${WC}\"Do you want extract resources? [y/N]\"${CCB}"
    echo "you can select ${GC}y${CCB} if you want to extract resources"
    echo "and if you dont want to extract resources"
    echo "you can select ${YC}N${CCB}"
    echo
    echo "Thats all done."
    echo
    echo "If you have error for ${WC}port already in use${CCB}"
    echo "You can change port in config.json"
    echo "and then you can use ${YC}Grasscutter Menu${CCB}"
    echo "and then you can select number"
    echo "1 -> 3 "
    echo "Then change the port, if current port is ${RC}443${CCB}"
    echo "Please change it. because on Android"
    echo "${RC}443${CCB} cant use in Android"
    echo "Maybe for ${YC}bypass using Root permission${CCB}"
    echo "${RC}But i dont recommend you to use Root permission${CCB}"
    echo "For force to use port ${RC}443${CCB}"
    echo "because it can make your phone unstable"
    echo "Just change it to ${GC}54321${CCB} or other Port!"
    echo ${WC}
    read -r -p "Press enter for back to Main Menu!"
    main_menu
}

main_menu() {
    credit_hah
    Center_Text "Main Menu"
    echo "1. ${CCB}Run Grasscutter${WC}"
    echo "2. ${CCB}Grasscutter Menu${WC}"
    echo "3. ${CCB}Grasscutter Tools${WC}"
    echo "4. ${CCB}GCAndroid Tools${WC}"
    echo "5. ${CCB}Install Menu${WC}"
    echo "6. ${CCB}About Us!${WC}"
    echo "7. ${CCB}How to setup Grasscutter${WC}"
    echo "8. ${CCB}Delete Avatars${WC}"
    echo "0. ${RC}Exit${WC}"
    echo
    echo -n "Enter input : "
    read -r inputmain
    case $inputmain in
    "1") GoTouchGrass ;;
    "2") Grasscutter_Menu ;;
    "3") Grasscutter_Tools ;;
    "4") gcandroidTools ;;
    "5") InstallMenu ;;
    "6") about_us ;;
    "7") how_to_setup ;;
    "8") delete_avatars ;;
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
for file in $GCAndroid/*.sh; do
    echo -ne "\033[2K\r${YC}Loading $(echo $file | cut -c 1-$(( $(tput cols) - 10 )))${WC}"
    source $file
done
Path_Shell="/usr/share/gcandroid"
for i in $(find "$Path_Shell/Edit_Config_Json" -type d); do
    for j in $(find "$i" -maxdepth 1 -type f); do
        . "$j"
    done
done
for i in $(find "$Path_Shell/Edit_Config_Json" -maxdepth 1 -type f); do
    . "$i"
done

newVersionScript=""
versionScript="2.8"
echo -en "\033[2K\r${GC}Load${WC} : ${CCB}getInfoUpdate [FROM SERVER]${WC}"
source <(curl -s https://raw.githubusercontent.com/Score-Inc/GCAndroid/Server/getInfoUpdate)
echo -en "\033[2K\r${GC}Load${WC} : ${CCB}updateScript.sh [FROM SERVER]${WC}"
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
else
    note_credit="${RC}Unknowm Version${WC}"
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
