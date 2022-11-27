Edit_Banner() {
    credit_hah
    echo "${YC}For exit CTRL+Q"
    echo "${YC}For save CTRL+S"
    echo "${YC}For help CTRL+G"
    sleep 1.5s
    micro "$HOME/Grasscutter/src/main/resources/defaults/data/Banners.tsj"
    Edit_Banners
}

Import_Banners() {
    credit_hah
    Center_Text "Import Banners"
    echo "${YC}For cancel enter b/B${WC}"
    echo -n "${GC}Enter the path to the file : ${WC}"
    read -r Import_Banners_Path
    if [[ "$Import_Banners_Path" == "b" ]] || [[ "$Import_Banners_Path" == "B" ]]; then
        Edit_Banners
    else
        # if file exist but not extension ".tsj", then error
        if [[ -f "$Import_Banners_Path" ]] && [[ ! "$Import_Banners_Path" == *.tsj ]]; then
            echo "${RC}Error${WC} : $Import_Banners_Path is not \".tsj\" extension${WC}"
            sleep 1s
            Import_Banners
        fi
        if [[ -f "$Import_Banners_Path" ]]; then
            cp "$Import_Banners_Path" "$HOME/Grasscutter/src/main/resources/defaults/data/Banners.tsj"
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
    Center_Text "Reset Banners"
    if [[ ! -f "$HOME/Grasscutter/src/main/resources/defaults/data/Banners.tsj" ]]; then
        echo "${RC}Banners.json not found!${WC}"
        echo -n "${GC}Do you want to download it from github? [Y/n] : ${WC}"
        read -r Download_Banners
        if [[ "$Download_Banners" == "y" ]] || [[ "$Download_Banners" == "Y" ]] || [[ "$Download_Banners" == "" ]]; then
            Run "wget -q https://raw.githubusercontent.com/Grasscutters/Grasscutter/development/src/main/resources/defaults/data/Banners.tsj -O \"$HOME/Grasscutter/src/main/resources/defaults/data/Banners.tsj\"" "Download Banners.tsj" "0" "Edit Banners" "Edit_Banners"
            echo "${GC}Banners.tsj downloaded successfully!${WC}"
            sleep 1.5s
            Edit_Banners
        else
            Edit_Banners
        fi
    else
        echo -n "${GC}Do you want to reset Banners.tsj? [Y/n] : ${WC}"
        read -r Reset_Banners
        if [[ "$Reset_Banners" == "y" ]] || [[ "$Reset_Banners" == "Y" ]] || [[ "$Reset_Banners" == "" ]]; then
            rm "$HOME/Grasscutter/src/main/resources/defaults/data/Banners.tsj"
            Run "wget -q https://raw.githubusercontent.com/Grasscutters/Grasscutter/development/src/main/resources/defaults/data/Banners.tsj -O \"$HOME/Grasscutter/src/main/resources/defaults/data/Banners.tsj\"" "Download Banners.tsj" "0" "Edit Banners" "Edit_Banners"
            echo "${GC}Banners.tsj reset successfully!${WC}"
            sleep 1.5s
            Edit_Banners
        else
            Edit_Banners
        fi
    fi
}

Edit_Banners() {
    credit_hah
    Center_Text "Edit Banners"
    if ! (command -v micro &> /dev/null); then
        echo "${GC}Installing micro text editor${WC}"
        apt install micro -y &> /dev/null
        credit_hah
        Center_Text "Edit Banners"
    fi
    if ! (command -v micro &> /dev/null); then
        echo "${RC}Failed to install micro text editor${WC}"
        echo
        echo -n "Press enter for back to Menu"
        read
        main_menu
    fi
    if [[ ! -d "$HOME/Grasscutter" ]]; then
        echo "${RC}Error${WC} : Grasscutter directory not found${WC}"
        echo
        echo -n "Press enter for back to Menu"
        read
        main_menu
    fi
    if [[ ! -f "$HOME/Grasscutter/gradlew" ]]; then
        echo "${RC}Error${WC} : Grasscutter gradlew file not found${WC}"
        echo
        echo -n "Press enter for back to Menu"
        read
        main_menu
    fi
    if [[ ! -f "$HOME/Grasscutter/src/main/resources/defaults/data/Banners.tsj" ]]; then
        echo "${RC}Error${WC} : Banners.tsj file not found${WC}"
        echo "${YC}Please Install Grasscutter with \"Compile\" not dowmload grasscutter.jar"
        echo
        echo -n "Press enter for back to Menu"
        read
        main_menu
    fi
    echo "1. ${CCB}Edit Banners.tsj${WC}"
    echo "2. ${CCB}Import Banners.tsj${WC}"
    echo "3. ${CCB}Reset Banners.tsj${WC}"
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
            echo "${RC}Error${WC} : Invalid Choice${WC}"
            sleep 1s
            Edit_Banners
            ;;
    esac
}
