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
    if [[ $Install_Grasscutter_Resources = "tamilpp25" ]]; then
        echo "${GC}Choose Version...${WC}"
        echo "1. ${CCB}3.1${WC}"
        echo "2. ${CCB}3.0${WC}"
        echo "2. ${CCB}2.8${WC}"
        echo "0. ${RC}Back/Cancel${WC}"
        echo
        echo -n "Enter input : ${CCB}"
        read Install_Grasscutter_process_input
        echo -n "${WC}"
        case $Install_Grasscutter_process_input in
            "1" ) Install_Grasscutter_Resources_Version="3.1";;
            "2" ) Install_Grasscutter_Resources_Version="3.0";;
            "3" ) Install_Grasscutter_Resources_Version="2.8";;
            "0" ) main_menu;;
            * ) echo "${RC}Wrong input!${WC}"
        esac
    elif [[ $Install_Grasscutter_Resources = "Yuuki" ]]; then
        echo "${GC}Choose Version...${WC}"
        echo "1. ${CCB}3.1${WC}"
        echo "2. ${CCB}3.0${WC}"
        echo "3. ${CCB}2.8${WC}"
        echo "4. ${CCB}2.7${WC}"
        echo "5. ${CCB}2.6${WC}"
        echo "0. ${RC}Back/Cancel${WC}"
        echo
        echo -n "Enter input : ${CCB}"
        read Install_Grasscutter_process_input
        case $Install_Grasscutter_process_input in
            "1" ) Install_Grasscutter_Resources_Version="3.1";;
            "2" ) Install_Grasscutter_Resources_Version="3.0";;
            "3" ) Install_Grasscutter_Resources_Version="2.8";;
            "4" ) Install_Grasscutter_Resources_Version="2.7";;
            "5" ) Install_Grasscutter_Resources_Version="2.6";;
            "0" ) main_menu;;
            * ) echo "${RC}Wrong input!${WC}"; sleep 1s; Install_Grasscutter_process;;
        esac
    fi
    credit_hah
    echo "${CCB}Resources : ${GC}$Install_Grasscutter_Resources${WC}"
    echo "${CCB}Version Resources : ${GC}$Install_Grasscutter_Resources_Version${WC}"
    echo "====================================="
    if [ -d "$HOME/Grasscutter-backup" ]; then
        echo "${RC}Can't do backup${YC}"
        echo "Because${WC} : $HOME/Grasscutter-backup exist"
        echo "${CCB}Remove manual for backup folder${WC}"
        echo
        echo -n "Press enter for continue remove Grasscutter folder and Install"
        read
    elif [ -d "$HOME/Grasscutter" ]; then
        echo "${GC}Backup Grasscutter...${WC}"
        mv $HOME/Grasscutter $HOME/Grasscutter-backup
        echo "${GC}Done...Now Install${WC}"
        sleep 1s
    fi
    clear
    credit_hah
    echo "${CCB}Resources : ${GC}$Install_Grasscutter_Resources${WC}"
    echo "${CCB}Version Resources : ${GC}$Install_Grasscutter_Resources_Version${WC}"
    echo "====================================="
    run_Program() { sudo apt install openjdk-17-jdk -y &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "${GC}Install Java JDK 17${WC}" "0" "Menu" "main_menu"
    if [ -d "$HOME/Grasscutter" ]; then
        rm -rf $HOME/Grasscutter
    fi
    sleep 1s
    cd $HOME || exit 1
    run_Program() { git clone https://github.com/Grasscutters/Grasscutter.git &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "${GC}Download Grasscutter${WC}" "0" "Menu" "main_menu"
    sleep 1s
    cd $HOME || exit 1
    if [[ $Install_Grasscutter_Resources = "tamilpp25" ]]; then
        if [[ $Install_Grasscutter_Resources_Version = "3.1" ]]; then
            run_Program() { wget https://github.com/tamilpp25/Grasscutter_Resources/archive/refs/heads/3.1.zip -O zResources.zip &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        elif [[ $Install_Grasscutter_Resources_Version = "3.0" ]]; then
            run_Program() { wget https://github.com/tamilpp25/Grasscutter_Resources/archive/refs/heads/3.0.zip -O zResources.zip &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        elif [[ $Install_Grasscutter_Resources_Version = "2.8" ]]; then
            run_Program() { wget https://github.com/tamilpp25/Grasscutter_Resources/archive/refs/heads/2.8.zip -O zResources.zip &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        fi
    elif [[ $Install_Grasscutter_Resources = "Yuuki" ]]; then
        if [[ $Install_Grasscutter_Resources_Version = "3.1" ]]; then
            run_Program() { wget https://gitlab.com/yukiz/GrasscutterResources/-/archive/3.1/GrasscutterResources-3.1.zip -O zResources.zip &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        if [[ $Install_Grasscutter_Resources_Version = "3.0" ]]; then
            run_Program() { wget https://gitlab.com/yukiz/GrasscutterResources/-/archive/3.0/GrasscutterResources-3.0.zip -O zResources.zip &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        elif [[ $Install_Grasscutter_Resources_Version = "2.8" ]]; then
            run_Program() { wget https://gitlab.com/yukiz/GrasscutterResources/-/archive/2.8/GrasscutterResources-2.8.zip -O zResources.zip &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        elif [[ $Install_Grasscutter_Resources_Version = "2.7" ]]; then
            run_Program() { wget https://gitlab.com/yukiz/GrasscutterResources/-/archive/2.7/GrasscutterResources-2.7.zip -O zResources.zip &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        elif [[ $Install_Grasscutter_Resources_Version = "2.6" ]]; then
            run_Program() { wget https://gitlab.com/yukiz/GrasscutterResources/-/archive/2.6/GrasscutterResources-2.8.zip -O zResources.zip &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
        fi
    fi
    run_Program & pid=$!
    spin "${GC}Download Resources${WC}" "0" "Menu" "main_menu"
    run_Program() { unzip $HOME/zResources.zip &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "${GC}Unzip Resources${WC}" "0" "Menu" "main_menu"
    sleep 1s
    run_Program() { mv $HOME/Grasscutter*Resources*/Resources $HOME/Grasscutter/resources &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "${GC}Move Resources to Grasscutter${WC}" "0" "Menu" "main_menu"
    rm -rf $HOME/Grasscutter*Resources*
    rm $HOME/zResources.zip
    cd $HOME/Grasscutter
    clear
    credit_hah
    echo "${CCB}Resources : ${GC}$Install_Grasscutter_Resources${WC}"
    echo "${CCB}Version Resources : ${GC}$Install_Grasscutter_Resources_Version${WC}"
    echo "====================================="
    echo "${GC}Compile jar (Please Wait)${WC}"
    ./gradlew jar
    mv grasscutter*.jar grasscutter.jar
    timeout --foreground 5s java -jar grasscutter.jar &> /dev/null
    clear
    credit_hah
    echo "${CCB}Resources : ${GC}$Install_Grasscutter_Resources${WC}"
    echo "${CCB}Version Resources : ${GC}$Install_Grasscutter_Resources_Version${WC}"
    echo "====================================="
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
