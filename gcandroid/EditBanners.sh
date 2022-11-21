Edit_Banners() {
    credit_hah
    if ! (command -v micro &> /dev/null); then
        echo "${GC}Installing micro text editor${NC}"
        apt install micro -y &> /dev/null
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
    echo "${GC}Editing banners${NC}"
    echo "${YC}For exit CTRL+Q${NC}"
    echo "${YC}For save CTRL+S${NC}"
    echo "${YC}For help CTRL+G${NC}"
    sleep 1.5s
    micro "$HOME/Grasscutter/src/main/resources/defaults/data/Banners.json"
    Grasscutter_Tools
}