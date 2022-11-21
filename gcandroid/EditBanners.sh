Edit_Banner() {
    credit_hah
    echo "${YC}For exit CTRL+Q"
    echo "${YC}For save CTRL+S"
    echo "${YC}For help CTRL+G"
    sleep 1.5s
    micro "$HOME/Grasscutter/src/main/resources/defaults/data/Banners.json"
    Edit_Banners
}

Import_Banners() {
    credit_hah
    echo "${YC}For cancel enter b/B${WC}"
    echo -n "${GC}Enter the path to the file : ${WC}"
    read -r Import_Banners_Path
    if [[ "$Import_Banners_Path" == "b" ]] || [[ "$Import_Banners_Path" == "B" ]]; then
        Edit_Banners
    else
        if [[ -f "$Import_Banners_Path" ]]; then
            cp "$Import_Banners_Path" "$HOME/Grasscutter/src/main/resources/defaults/data/Banners.json"
            echo "${GC}File imported successfully!${WC}"
            sleep 1.5s
            Edit_Banners
        else
            echo "${RC}File not found!${WC}"
            sleep 1.5s
            Import_Banners
        fi
    fi
}

Reset_Banners() {
    credit_hah
    if [[ ! -f "$HOME/Grasscutter/src/main/resources/defaults/data/Banners.json" ]]; then
        echo "${RC}Banners.json not found!${WC}"
        echo -n "${GC}Do you want to download it from github? [Y/n] : ${WC}"
        read -r Download_Banners
        if [[ "$Download_Banners" == "y" ]] || [[ "$Download_Banners" == "Y" ]] || [[ "$Download_Banners" == "" ]]; then
            wget -q https://raw.githubusercontent.com/Grasscutters/Grasscutter/main/src/main/resources/defaults/data/Banners.json -O "$HOME/Grasscutter/src/main/resources/defaults/data/Banners.json"
            echo "${GC}Banners.json downloaded successfully!${WC}"
            sleep 1.5s
            Edit_Banners
        else
            Edit_Banners
        fi
    else
        echo -n "${GC}Do you want to reset Banners.json? [Y/n] : ${WC}"
        read -r Reset_Banners
        if [[ "$Reset_Banners" == "y" ]] || [[ "$Reset_Banners" == "Y" ]] || [[ "$Reset_Banners" == "" ]]; then
            rm "$HOME/Grasscutter/src/main/resources/defaults/data/Banners.json"
            wget -q https://raw.githubusercontent.com/Grasscutters/Grasscutter/development/src/main/resources/defaults/data/Banners.json -O "$HOME/Grasscutter/src/main/resources/defaults/data/Banners.json"
            echo "${GC}Banners.json reset successfully!${WC}"
            sleep 1.5s
            Edit_Banners
        else
            Edit_Banners
        fi
    fi
}

Edit_Banners() {
    credit_hah
    if ! (command -v micro &> /dev/null); then
        echo "${GC}Installing micro text editor${NC}"
        apt install micro -y &> /dev/null
        credit_hah
    fi
    if ! (command -v micro &> /dev/null); then
        echo "${RC}Failed to install micro text editor${NC}"
        echo
        echo -n "Press enter for back to Menu"
        read
        main_menu
    fi
    if [[ ! -d "$HOME/Grasscutter" ]]; then
        echo "${RC}Error${WC} : Grasscutter directory not found${NC}"
        echo
        echo -n "Press enter for back to Menu"
        read
        main_menu
    fi
    if [[ ! -f "$HOME/Grasscutter/gradlew" ]]; then
        echo "${RC}Error${WC} : Grasscutter gradlew file not found${NC}"
        echo
        echo -n "Press enter for back to Menu"
        read
        main_menu
    fi
    if [[ ! -f "$HOME/Grasscutter/src/main/resources/defaults/data/Banners.json" ]]; then
        echo "${RC}Error${WC} : Banners.json file not found${NC}"
        echo "${YC}Please Install Grasscutter with \"Compile\" not dowmload grasscutter.jar"
        echo
        echo -n "Press enter for back to Menu"
        read
        main_menu
    fi
    echo "1. ${CCB}Edit Banners.json${WC}"
    echo "2. ${CCB}Import Banners.json${WC}"
    echo "3. ${CCB}Reset Banners.json${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter your choice : "
    read Edit_Banners_Choice
    case $Edit_Banners_Choice in
        1)
            Edit_Banner
            ;;
        2)
            Import_Banners
            ;;
        3)
            Reset_Banners
            ;;
        0)
            Grasscutter_Tools
            ;;
        *)
            echo "${RC}Error${WC} : Invalid Choice${NC}"
            sleep 1s
            Edit_Banners
            ;;
    esac
}
