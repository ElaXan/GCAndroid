#!/data/data/com.termux/files/usr/bin/bash

# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

GC="$(printf '\033[1;32m')"
RC="$(printf '\033[1;31m')"
YC="$(printf '\033[1;33m')"
CCB="$(printf '\033[1;36m')"
CCU="$(printf '\033[4;36m')"
WC="$(printf '\033[0;37m')"

GCAndroid=$HOME/.ElaXan/GCAndroid
line="====================================="

isThisLinux=$(uname -o)
if [ $isThisLinux = "GNU/Linux" ]; then
    echo "${RC}Please run on Termux Environment!\n${GC}Try to reinstall and see GCAndroid Github for more informations...${WC}"
    exit 2
fi

grasscutter_path=$HOME/Grasscutter
configpath=$grasscutter_path/config.json
wherethegrassss=$grasscutter_path/grasscutter.jar
Path_Shell=$GCAndroid/gcandroid
inpscript=$1

# check dependencies without run in inside array
dependencies_apt=(
    "perl"
    "wget"
    "jq"
    "tput"
    "nc"
)


dependencies_apt_install=(
    "perl"
    "wget"
    "jq"
    "ncurses-utils"
    "netcat-openbsd"
)

for package in "${dependencies_apt[@]}"; do
    if ! command -v $package &>/dev/null; then
        echo "Install : $package"
        for i in "${dependencies_apt_install[@]}"; do
            apt install $i -y
        done
    fi
done


# Check if install dependencies is failed by checking package not found
for package in "${dependencies_apt[@]}"; do
    if ! command -v $package &>/dev/null; then
        echo "${RC}Error${WC} : $package not found!"
        echo
        echo -n "Press enter for exit"
        read
        exit 1
    fi
done

Center_Text() {
    textss=$1

    lines=$(echo $line | wc -c)
    textss=$(echo $1 | wc -c)
    space=$((lines - textss))
    space=$((space / 2))
    space=$(printf "%${space}s")
    case $2 in
    link)
        if [ $3 = Cyan ]; then
            echo "${space}${CCU}$1${WC}"
        fi
        ;;
    error)
        if [ $3 = Red ]; then
            echo "${space}${RC}$1${WC}"
        fi
        ;;
    *)
        echo "${GC}${space}$1${WC}"
        ;;
    esac
    echo $line
}

clear
echo -n "${WC}"
echo $line
Center_Text "Project Owner by ElaXan"
Center_Text "LOADING..."
echo "${CCU}https://github.com/Score-Inc/GCAndroid${WC}"
echo $line
echo "${GC}Contact me at zero@elaxan.com${WC}"
echo $line

if [ ! -f "$HOME/.ElaXan/GCAndroid/repo.json" ]; then
    echo "{
    \"Grasscutter\": \"https://github.com/Grasscutters/Grasscutter.git\",
    \"Resources\": \"https://gitlab.com/YuukiPS/GC-Resources/-/archive/3.4/GC-Resources-3.4.zip\"
}" > "$HOME/.ElaXan/GCAndroid/repo.json"
else
    if [ ! -s "$HOME/.ElaXan/GCAndroid/repo.json" ]; then
        echo "{
    \"Grasscutter\": \"https://github.com/Grasscutters/Grasscutter.git\",
    \"Resources\": \"https://gitlab.com/YuukiPS/GC-Resources/-/archive/3.4/GC-Resources-3.4.zip\"
}" > "$HOME/.ElaXan/GCAndroid/repo.json"
        echo "${RC}Error${WC} : repo.json is empty! We have fixed it for you!"
    fi

    if ! (jq . "$HOME/.ElaXan/GCAndroid/repo.json" &>/dev/null); then
        echo "{
    \"Grasscutter\": \"https://github.com/Grasscutters/Grasscutter.git\",
    \"Resources\": \"https://gitlab.com/YuukiPS/GC-Resources/-/archive/3.4/GC-Resources-3.4.zip\"
}" > "$HOME/.ElaXan/GCAndroid/repo.json"
        echo "${RC}Error${WC} : repo.json is broken! We have fixed it for you to default!"
    fi
fi

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
        apt install micro -y
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
        "y" | "Y" | "")
            credit_hah
            Center_Text "Mongodb Install"
            Run "apt install tur-repo -y" "Installing Tur Repo" "0" "Install Menu" "installMenu"
            Run "apt reinstall mongodb -y" "Reinstalling Mongodb" "0" "Install Menu" "installMenu"
            echo
            echo -n "Press enter for back to Main Menu"
            read -r
            main_menu
            ;;
        "n" | "N") main_menu ;;
        *)
            echo "Wrong Input!"
            sleep 1s
            installMongodb
            ;;
        esac
    else
        Run "apt install tur-repo -y" "Installing Tur Repo" "0" "Install Menu" "installMenu"
        Run "apt install mongodb -y" "Installing Mongodb" "0" "Install Menu" "installMenu"
        echo
        echo -n "Press enter for back to Main Menu"
        read
        main_menu
    fi
}

Docker() {
    credit_hah
    Center_Text "Docker"
    echo "1. ${CCB}Download grasscutter.jar${WC}"
    echo "2. ${CCB}Pull DockerGS image${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read Docker_input
    case $Docker_input in
    "1") Download_Grasscutter ;;
    "2") Pull_DockerGS_Image ;;
    "0") Grasscutter_Tools ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 1s
        Docker
        ;;
    esac
}

Install_Grasscutter_Menu() {
    credit_hah
    Center_Text "Install Grasscutter"
    echo "1. ${CCB}Compile from source${WC}"
    echo "2. ${CCB}Download from Github (Docker)${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read Install_Grasscutter_Menu_input
    case $Install_Grasscutter_Menu_input in
    "1") Install_Grasscutter ;;
    "2") Docker ;;
    "0") Grasscutter_Menu ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 1s
        Install_Grasscutter_Menu
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
            Install_Grasscutter_process
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
        Install_Grasscutter_process
    fi
}

Grasscutter_Menu() {
    credit_hah
    Center_Text "Grasscutter Menu"
    echo "1. ${CCB}Install Grasscutter${WC}"
    echo "2. ${CCB}Compile .jar${WC}"
    echo "3. ${CCB}Update Grasscutter${WC}"
    echo "4. ${CCB}Download Resources Only${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r Grasscutter_Menu_Input
    case $Grasscutter_Menu_Input in
    "1") Install_Grasscutter_Menu ;;
    "2") Compile_Grasscutter ;;
    "3") Update_Grasscutter ;;
    "4") Download_Resources ;;
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
            Run "apt reinstall openjdk-17 -y" "Install Java JDK 17" "0" "Install Menu" "InstallMenu"
        else
            echo "${RC}Wrong Input!${WC}"
            sleep 1s
            installJavaJDK17
        fi
    else
        Run "apt reinstall openjdk-17 -y" "Install Java JDK 17" "0" "Install Menu" "InstallMenu"
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
    echo "${CCB}Documentation: ${CCU}https://docs.elaxan.com${WC}"
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

settingsMenu() {
    credit_hah
    Center_Text "Settings Menu"
    echo "1. ${CCB}Grasscutter Repo${WC}"
    echo "2. ${CCB}Resources Repo${WC}"
    echo "3. ${YC}Reset settings.json${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r about_us_input
    case $about_us_input in
    "1") GrasscutterRepo ;;
    "2") ResourcesRepo ;;
    "3") ResetSettingsJSON ;;
    "0") main_menu ;;
    *) echo "Wrong input!${WC}"
        sleep 1s
        settingsMenu
    esac
}

main_menu() {
    credit_hah
    Center_Text "Main Menu"
    echo "1. ${CCB}Run Grasscutter${WC}"
    echo "2. ${CCB}Grasscutter Menu${WC}"
    echo "3. ${CCB}Grasscutter Tools${WC}"
    echo "4. ${CCB}GCAndroid Tools${WC}"
    echo "5. ${CCB}Install Menu${WC}"
    echo "6. ${CCB}Setting Repo${WC}"
    echo "7. ${CCB}About Us!${WC}"
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
    "6") settingsMenu ;;
    "7") about_us ;;
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
for file in $Path_Shell/*.sh; do
    echo -ne "\033[2K\r${GC}Load : ${CCB}$(echo $file | cut -c 1-$(( $(tput cols) - 10 )))${WC}"
    source $file
done
for i in $(find "$Path_Shell/Edit_Config_Json" -type d); do
    for j in $(find "$i" -maxdepth 1 -type f); do
        . "$j"
    done
done

newVersionScript=""
versionScript="3.3.5"
echo -en "\033[2K\r${GC}Load${WC} : ${CCB}getInfoUpdate [FROM SERVER]${WC}"
source <(curl -s https://raw.githubusercontent.com/Score-Inc/GCAndroid/Server/getInfoUpdate)
echo -en "\033[2K\r${GC}Load${WC} : ${CCB}updateScript.sh [FROM SERVER]${WC}"
source <(curl -s https://raw.githubusercontent.com/Score-Inc/GCAndroid/Server/updateScript.sh)
if [[ $newVersionScript = "" ]]; then
    clear
    note_credit=$(Center "Can't connect to server!")
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
