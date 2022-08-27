Install_Grasscutter_process() {
    if ! command -v unzip &> /dev/null; then
        echo "${GC}Installing unzip command...${WC}"
        sudo apt install unzip -y &> /dev/null
    fi
    if ! command -v git &> /dev/null; then
        echo "${GC}Installing git command...${WC}"
        sudo apt install git -y &> /dev/null
    fi
    credit_hah
    cd $HOME || exit 1
    if [[ $Install_Grasscutter_Resources = "Koko-Boya" ]]; then
        echo "${GC}Choose Version...${WC}"
        echo "${CCB}1. 3.0"
        echo "2. 2.8"
        echo "0. Back/Cancel"
        echo
        echo -n "Enter input : ${CCB}"
        read Install_Grasscutter_process_input
        case $Install_Grasscutter_process_input in
            "1" ) Install_Grasscutter_Resources_Version="3.0";;
            "2" ) Install_Grasscutter_Resources_Version="2.8";;
            "0" ) main_menu;;
            * ) echo "${RC}Wrong input!${WC}"
        esac
    elif [[ $Install_Grasscutter_Resources = "Yuuki" ]]; then
        echo "${GC}Choose Version...${WC}"
        echo "${CCB}1. 3.0"
        echo "2. 2.8"
        echo "3. 2.7"
        echo "4. 2.6"
        echo "0. ${RC}Back/Cancel${WC}"
        echo
        echo -n "Enter input : ${CCB}"
        read Install_Grasscutter_process_input
        case $Install_Grasscutter_process_input in
            "1" ) Install_Grasscutter_Resources_Version="3.0";;
            "2" ) Install_Grasscutter_Resources_Version="2.8";;
            "3" ) Install_Grasscutter_Resources_Version="2.7";;
            "4" ) Install_Grasscutter_Resources_Version="2.6";;
            "0" ) main_menu;;
            * ) echo "${RC}Wrong input!${WC}"; sleep 1s; Install_Grasscutter_process;;
        esac
    fi
    credit_hah
    echo "${CCB}Resources : ${GC}$Install_Grasscutter_Resources${WC}"
    echo "${CCB}Version Resources : ${GC}$Install_Grasscutter_Resources_Version${WC}"
    echo "====================================="
    echo "${GC}Install Java JDK 17${WC}"
    sleep 1s
    sudo apt install openjdk-17-jdk -y &> /dev/null
    if [ -d "$HOME/Grasscutter" ]; then
        rm -rf $HOME/Grasscutter
    fi
    sleep 1s
    cd $HOME || exit 1
    echo "${GC}Download Grasscutter and Resources${WC}"
    git clone https://github.com/Grasscutters/Grasscutter.git
    echo "${GC}Download Resources...${WC}"
    sleep 1s
    cd $HOME || exit 1
    if [[ $Install_Grasscutter_Resources = "Koko-Boya" ]]; then
        if [[ $Install_Grasscutter_Resources_Version = "3.0" ]]; then
            wget https://github.com/Koko-boya/Grasscutter_Resources/archive/refs/heads/3.0.zip -O zResources.zip -q --show-progress
        elif [[ $Install_Grasscutter_Resources_Version = "2.8" ]]; then
            wget https://github.com/Koko-boya/Grasscutter_Resources/archive/refs/heads/2.8.zip -O zResources.zip -q --show-progress
        fi
    elif [[ $Install_Grasscutter_Resources = "Yuuki" ]]; then
        if [[ $Install_Grasscutter_Resources_Version = "3.0" ]]; then
            wget https://gitlab.com/yukiz/GrasscutterResources/-/archive/3.0/GrasscutterResources-3.0.zip -O zResources.zip -q --show-progress
        elif [[ $Install_Grasscutter_Resources_Version = "2.8" ]]; then
            wget https://gitlab.com/yukiz/GrasscutterResources/-/archive/2.8/GrasscutterResources-2.8.zip -O zResources.zip -q --show-progress
        elif [[ $Install_Grasscutter_Resources_Version = "2.7" ]]; then
            wget https://gitlab.com/yukiz/GrasscutterResources/-/archive/2.7/GrasscutterResources-2.7.zip -O zResources.zip -q --show-progress
        elif [[ $Install_Grasscutter_Resources_Version = "2.6" ]]; then
            wget https://gitlab.com/yukiz/GrasscutterResources/-/archive/2.6/GrasscutterResources-2.6.zip -O zResources.zip -q --show-progress
        fi
    fi
    echo -e "${GC}Unzip Resources Don't exit/kill or close termux...${WC}"
    unzip $HOME/zResources.zip &> /dev/null
    echo "${GC}Move Resources to Grasscutter${WC}"
    sleep 1s
    mv $HOME/Grasscutter*Resources*/Resources $HOME/Grasscutter/resources
    rm -rf $HOME/Grasscutter*Resources*
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