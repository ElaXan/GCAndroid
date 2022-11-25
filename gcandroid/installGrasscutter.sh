# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

Install_Grasscutter_process() {
    if ! command -v unzip &>/dev/null; then
        echo "${GC}Installing unzip command...${WC}"
        sudo apt install unzip -y &>/dev/null
    fi
    if ! command -v git &>/dev/null; then
        echo "${GC}Installing git command...${WC}"
        sudo apt install git -y &>/dev/null
    fi
    if [[ $Grasscutter_Already_Installed == "1" ]]; then
        credit_hah
        echo "${GC}Do you want to keep resources folder?${WC}"
        echo
        echo -n "Enter your choice [y/N] : "
        read Keep_Resources
        if [[ $Keep_Resources == "y" || $Keep_Resources == "Y" ]]; then
            Backup_Resources="1"
        elif [[ $Keep_Resources == "n" || $Keep_Resources == "N" ]]; then
            Backup_Resources="0"
        else
            echo "${RC}Invalid choice${WC}"
            echo
            echo -n "Press enter for back to Menu"
            read
            main_menu
        fi
    fi
    credit_hah
    Center_Text "Install Grasscutter Version Select"
    cd $HOME || exit 1
    echo "1. ${CCB}Compile grasscutter.jar${WC}"
    echo "2. ${CCB}Download grasscutter.jar${WC}"
    echo "0. ${RC}Cancel${WC}"
    echo
    echo -n "Enter Input : ${CB}"
    read -r Install_Grasscutter_process_grasscutter_input
    case $Install_Grasscutter_process_grasscutter_input in
        "1") Install_Grasscutter_process_grasscutter="compile" ;;
        "2") Install_Grasscutter_process_grasscutter="download" ;;
        "0") main_menu ;;
        * )
            echo "${RC}Wrong Input!${WC}"
            sleep 1s
            Install_Grasscutter_process
    esac
    credit_hah
    Center_Text "Install Grasscutter Version Select"
    if [[ $Backup_Resources == "0" ]]; then
        if [[ $Install_Grasscutter_Resources = "tamilpp25" ]]; then
            echo "${GC}Choose Version Resources...${WC}"
            echo "1. ${CCB}3.2${WC}"
            echo "2. ${CCB}3.1${WC}"
            echo "3. ${CCB}3.0${WC}"
            echo "4. ${CCB}2.8${WC}"
            echo "0. ${RC}Back/Cancel${WC}"
            echo
            echo -n "Enter input : ${CCB}"
            read Install_Grasscutter_process_input
            echo -n "${WC}"
            case $Install_Grasscutter_process_input in
            "1") Install_Grasscutter_Resources_Version="3.2" ;;
            "2") Install_Grasscutter_Resources_Version="3.1" ;;
            "3") Install_Grasscutter_Resources_Version="3.0" ;;
            "4") Install_Grasscutter_Resources_Version="2.8" ;;
            "0") main_menu ;;
            *) echo "${RC}Wrong input!${WC}" ;;
            esac
        elif [[ $Install_Grasscutter_Resources = "Yuuki" ]]; then
            echo "${GC}Choose Version Resources...${WC}"
            echo "1. ${CCB}3.2${WC}"
            echo "2. ${CCB}3.1${WC}"
            echo "3. ${CCB}3.0${WC}"
            echo "4. ${CCB}2.8${WC}"
            echo "5. ${CCB}2.7${WC}"
            echo "6. ${CCB}2.6${WC}"
            echo "0. ${RC}Back/Cancel${WC}"
            echo
            echo -n "Enter input : ${CCB}"
            read Install_Grasscutter_process_input
            case $Install_Grasscutter_process_input in
            "1") Install_Grasscutter_Resources_Version="3.2" ;;
            "2") Install_Grasscutter_Resources_Version="3.1" ;;
            "3") Install_Grasscutter_Resources_Version="3.0" ;;
            "4") Install_Grasscutter_Resources_Version="2.8" ;;
            "5") Install_Grasscutter_Resources_Version="2.7" ;;
            "6") Install_Grasscutter_Resources_Version="2.6" ;;
            "0") main_menu ;;
            *)
                echo "${RC}Wrong input!${WC}"
                sleep 1s
                Install_Grasscutter_process
                ;;
            esac
        fi
    fi
    credit_hah
    if [[ $Backup_Resources == "0" ]]; then
        echo "${CCB}Resources : ${GC}$Install_Grasscutter_Resources${WC}"
        echo "${CCB}Version Resources : ${GC}$Install_Grasscutter_Resources_Version${WC}"
        echo "====================================="
    fi
    if [[ $Backup_Resources == "1" ]]; then
        echo "${CCB}Backup Resources : ${GC}Yes${WC}"
        if [ -f $(echo Grasscutter/resources*) ]; then
            mv $HOME/Grasscutter/resources* "$HOME/resourcesBackupGCAndroid.zip"
        elif [ -d $(echo Grasscutter/resources* ) ]; then
            mv $HOME/Grasscutter/resources* "$HOME/resourcesBackupGCAndroid"
        elif [[ -z $(ls -A $HOME/Grasscutter/resources*) ]]; then
            echo "${CCB}Resources : ${RC}Resources is exist but empty${WC}"
            echo
            echo -n "Press enter for back to Menu"
            read
            main_menu
        elif ! (${checkResources} > /dev/null 2>&1); then
            echo "${CCB}Resources : ${RC}Resources is not exist${WC}"
            echo 
            echo -n "Press enter for back to Menu"
            read
            main_menu
        else
            echo "${RC}Errors while backup resources${WC}"
            echo
            echo -n "Press enter for back to Menu"
            read
            main_menu
        fi
        echo $line
    elif [[ $Backup_Resources == "0" ]]; then
        echo "${CCB}Backup Resources : ${GC}No${WC}"
    else
        echo "${CCB}Backup Resources : ${RC}Not Selected${WC}"
    fi
    if [[ $Backup_Resources == "0" ]]; then
        clear
        credit_hah
        echo "${CCB}Resources : ${GC}$Install_Grasscutter_Resources${WC}"
        echo "${CCB}Version Resources : ${GC}$Install_Grasscutter_Resources_Version${WC}"
        echo "====================================="
    fi
    run_Program() {
        sudo apt install openjdk-17-jdk -y &>$HOME/zerr.log
        errCode=$?
        log "$errCode"
    }
    run_Program &
    pid=$!
    spin "${GC}Install Java JDK 17${WC}" "0" "Menu" "main_menu"
    if [ -d "$HOME/Grasscutter" ]; then
        run_Program() {
            rm -rf $HOME/Grasscutter &>$HOME/zerr.log
            errCode=$?
            log "$errCode"
        }
        run_Program &
        pid=$!
        spin "${GC}Removing Folder Grasscutter${WC}" "0" "Menu" "main_menu"
    fi
    sleep 1s
    cd $HOME || exit 1
    if [[ $Install_Grasscutter_process_grasscutter = "compile" ]]; then
        run_Program() {
            git clone https://github.com/Grasscutters/Grasscutter.git &>$HOME/zerr.log
            errCode=$?
            log "$errCode"
        }
        run_Program &
        pid=$!
        spin "${GC}Clone Repository Grasscutter${WC}" "0" "Menu" "main_menu"
    elif [[ $Install_Grasscutter_process_grasscutter = "download" ]]; then
        if [ ! -f "Grasscutter" ]; then
            mkdir "Grasscutter"
        fi
        cd "Grasscutter" || exit 1
        run_Program() {
            wget https://github.com/Score-Inc/GCAndroid/releases/download/grasscutter/grasscutter-1.4.4-dev-1e932ce1.jar -O grasscutter.jar &>$HOME/zerr.log
            errCode=$?
            log "$errCode"
        }
        run_Program &
        pid=$!
        spin "${GC}Download Grasscutter${WC}" "0" "Menu" "main_menu"
        run_Program() {
            wget https://github.com/Score-Inc/GCAndroid/releases/download/grasscutter/keystore.p12 &>$HOME/zerr.log
            errCode=$?
            log "$errCode"
        }
        run_Program &
        pid=$!
        spin "${GC}Download SSL/Certificate${WC}" "0" "Menu" "main_menu"
    fi
    sleep 1s
    cd $HOME || exit 1
    if [[ $Backup_Resources == "0" ]]; then
        if [[ $Install_Grasscutter_Resources = "tamilpp25" ]]; then
            if [[ $Install_Grasscutter_Resources_Version = "3.2" ]]; then
                run_Program() {
                    wget https://git.crepe.moe/tamilpp25/Grasscutter_Resources/-/archive/3.2/Grasscutter_Resources-3.2.zip -O resourcesGCAndroid.zip &>$HOME/zerr.log
                    errCode=$?
                    log "$errCode"
                }
            elif [[ $Install_Grasscutter_Resources_Version = "3.1" ]]; then
                run_Program() {
                    wget https://git.crepe.moe/tamilpp25/Grasscutter_Resources/-/archive/3.1/Grasscutter_Resources-3.1.zip -O resourcesGCAndroid.zip &>$HOME/zerr.log
                    errCode=$?
                    log "$errCode"
                }
            elif [[ $Install_Grasscutter_Resources_Version = "3.0" ]]; then
                run_Program() {
                    wget https://git.crepe.moe/tamilpp25/Grasscutter_Resources/-/archive/3.0/Grasscutter_Resources-3.0.zip -O resourcesGCAndroid.zip &>$HOME/zerr.log
                    errCode=$?
                    log "$errCode"
                }
            elif [[ $Install_Grasscutter_Resources_Version = "2.8" ]]; then
                run_Program() {
                    wget https://git.crepe.moe/tamilpp25/Grasscutter_Resources/-/archive/2.8/Grasscutter_Resources-2.8.zip -O resourcesGCAndroid.zip &>$HOME/zerr.log
                    errCode=$?
                    log "$errCode"
                }
            fi
        elif [[ $Install_Grasscutter_Resources = "Yuuki" ]]; then
            if [[ $Install_Grasscutter_Resources_Version = "3.2" ]]; then
                run_Program() {
                    wget https://gitlab.com/yukiz/GrasscutterResources/-/archive/3.2/GrasscutterResources-3.2.zip -O resourcesGCAndroid.zip &>$HOME/zerr.log
                    errCode=$?
                    log "$errCode"
                }
            elif [[ $Install_Grasscutter_Resources_Version = "3.1" ]]; then
                run_Program() {
                    wget https://gitlab.com/yukiz/GrasscutterResources/-/archive/3.1/GrasscutterResources-3.1.zip -O resourcesGCAndroid.zip &>$HOME/zerr.log
                    errCode=$?
                    log "$errCode"
                }
            elif [[ $Install_Grasscutter_Resources_Version = "3.0" ]]; then
                run_Program() {
                    wget https://gitlab.com/yukiz/GrasscutterResources/-/archive/3.0/GrasscutterResources-3.0.zip -O resourcesGCAndroid.zip &>$HOME/zerr.log
                    errCode=$?
                    log "$errCode"
                }
            elif [[ $Install_Grasscutter_Resources_Version = "2.8" ]]; then
                run_Program() {
                    wget https://gitlab.com/yukiz/GrasscutterResources/-/archive/2.8/GrasscutterResources-2.8.zip -O resourcesGCAndroid.zip &>$HOME/zerr.log
                    errCode=$?
                    log "$errCode"
                }
            elif [[ $Install_Grasscutter_Resources_Version = "2.7" ]]; then
                run_Program() {
                    wget https://gitlab.com/yukiz/GrasscutterResources/-/archive/2.7/GrasscutterResources-2.7.zip -O resourcesGCAndroid.zip &>$HOME/zerr.log
                    errCode=$?
                    log "$errCode"
                }
            elif [[ $Install_Grasscutter_Resources_Version = "2.6" ]]; then
                run_Program() {
                    wget https://gitlab.com/yukiz/GrasscutterResources/-/archive/2.6/GrasscutterResources-2.8.zip -O resourcesGCAndroid.zip &>$HOME/zerr.log
                    errCode=$?
                    log "$errCode"
                }
            fi
        fi
        run_Program &
        pid=$!
        spin "${GC}Download Resources${WC}" "0" "Menu" "main_menu"
        echo -n "Do you want to extract resources? (y/N) : "
        read -r Install_Grasscutter_process_grasscutter_extract
        if [[ $Install_Grasscutter_process_grasscutter_extract == "y" ]] || [[ $Install_Grasscutter_process_grasscutter_extract == "Y" ]]; then
            run_Program() {
                unzip resourcesGCAndroid.zip &>$HOME/zerr.log
                errCode=$?
                log "$errCode"
            }
            run_Program &
            pid=$!
            spin "${GC}Unzip Resources${WC}" "0" "Menu" "main_menu"
            mv Grasscutter*Resources*/Resources Grasscutter/resources
            rm -rf Grasscutter*Resources*
            rm resourcesGCAndroid.zip
        else
            echo "${GC}Skip extracting Resources${WC}"
            mv resourcesGCAndroid.zip Grasscutter/
            sleep 1s
        fi
    fi
    cd $HOME/Grasscutter || exit 1
    credit_hah
    if [[ $Backup_Resources == "0" ]]; then
        echo "${CCB}Resources : ${GC}$Install_Grasscutter_Resources${WC}"
        echo "${CCB}Version Resources : ${GC}$Install_Grasscutter_Resources_Version${WC}"
        echo "====================================="
    fi
    if [[ $Install_Grasscutter_process_grasscutter = "compile" ]]; then
        echo "${GC}Compile jar (Please Wait)${WC}"
        ./gradlew jar
        if [[ $? != 0 ]]; then
            echo "${RC}Compile jar failed${WC}"
            echo
            echo -n "Press enter for back to menu"
            read -r
            main_menu
        fi
        mv grasscutter*.jar grasscutter.jar
    fi
    echo "${GC}Generate config.json${WC}"
    timeout --foreground 8s java -jar grasscutter.jar &>/dev/null
    clear
    credit_hah
    if [[ $Backup_Resources == "0" ]]; then
        echo "${CCB}Resources : ${GC}$Install_Grasscutter_Resources${WC}"
        echo "${CCB}Version Resources : ${GC}$Install_Grasscutter_Resources_Version${WC}"
        echo "====================================="
    elif [[ $Backup_Resources == "1" ]]; then
        if [ -d $HOME/Grasscutter/resources ]; then
            rm -rf $HOME/Grasscutter/resources
        fi
        if [[ -f $(echo $HOME/resourcesBackupGCAndroid*) ]]; then
            mv $HOME/resourcesBackupGCAndroid.zip $HOME/Grasscutter/resourcesGCAndroid.zip
            Install_Grasscutter_process_grasscutter_extract="y"
        elif [[ -d $(echo $HOME/resourcesBackupGCAndroid*) ]]; then
            mv $HOME/resourcesBackupGCAndroid $HOME/Grasscutter/resources
        else
            echo "${RC}Backup resources not found${WC}"
        fi
    fi
    echo "${GC}Editing config.json...${WC}"
    
    if [ ! -f "config.json" ]; then
        echo "${RC}config.json not found..."
        echo "${YC}Skip edit config.json...${WC}"
    else
        sed -i "s/\"bindPort\": 443/\"bindPort\": 54321/g" config.json
        if [[ $Install_Grasscutter_process_grasscutter_extract != "y" ]] || [[ $Install_Grasscutter_process_grasscutter_extract != "Y" ]]; then
            sed -i "s/\"resources\": \".*\"/\"resources\": \".\/resourcesGCAndroid.zip\"/g" config.json
        fi
        sed -i "s/\"welcomeMessage\": \".*\"/\"welcomeMessage\": \"Localhost on Android using GCAndroid(Z3RO ElaXan)\\\n\\\nhttps:\/\/github.com\/Score-Inc\/GCAndroid\"/g" config.json
        sed -i "s/\"nickName\": \".*\"/\"nickName\": \"ElaXan\"/g" config.json
        sed -i "s/\"signature\": \".*\"/\"signature\": \"Welcome to GCAndroid, run with Grasscutter!\"/g" config.json
        sleep 1s
        echo "${GC}Done Set All"
        echo "Address : 127.0.0.1"
        echo "Port : 54321${WC}"
    fi
    echo ""
    echo -n "Press enter for back to Menu!"
    read
    main_menu
}
