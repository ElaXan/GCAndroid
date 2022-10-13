installPlugin_Download() {
    credit_hah
    echo "${YC}Press b/B for back${WC}"
    echo
    echo -n "${GC}Enter link Github : ${WC}"
    read -r installPlugin_Download_Link
    if [[ $installPlugin_Download_Link == "" ]]; then
        echo "${RC}Please enter link!"
        sleep 1s
        installPlugin_Download
    elif [[ $installPlugin_Download_Link == "b" ]] || [[ $installPlugin_Download_Link == "B" ]]; then
        installPlugin
    fi
}

installPlugin_from_directory() {
    credit_hah
    echo "${YC}Enter b/B for back${WC}"
    echo
    echo "${CCB}Please enter where .jar plugin${WC}"
    echo -n "${GC}Path : "
    read -r installPlugin_from_directory_Input
    if [[ $installPlugin_from_directory_Input == "" ]]; then
        echo "${RC}Please enter path!${WC}"
        sleep 1s
        installPlugin_from_directory
    elif [[ $installPlugin_from_directory_Input == "b" ]] || [[ $installPlugin_from_directory_Input == "B" ]]; then
        installPlugin
    fi
    if ! [ -f $installPlugin_from_directory_Input ]; then 
        echo "${RC}.jar not found!${WC}"
        sleep 1s
        installPlugin_from_directory
    else
        if ! [ $(ls $installPlugin_from_directory_Input | sed "s/.*\.//g") == "jar" ]; then
            echo "${RC}Cannot continue because $installPlugin_from_directory_Input not .jar file!${WC}"
            echo
            read -p "Press enter for back to Menu!"
            main_menu
        else
            cp $installPlugin_from_directory_Input $HOME/Grasscutter/plugin &>/dev/null
        fi

        if [[ ! -f "$HOME/Grasscutter/plugin" ]]; then
            echo "${RC}Failed install plugin to Grasscutter Folder!${WC}"
            echo
            read -p "Press enter for back to Menu!"
            main_menu
        else
            echo "${GC}Plugin success installed!${WC}"
            echo
            read -p "Press enter for back to Menu!"
            main_menu
        fi
    fi
}



installPlugin() {
    credit_hah
    if ! [ -d "$HOME/Grasscutter" ]; then
        echo "${RC}$HOME/Grasscutter is not found!${WC}"
        echo
        read -p "Press enter for back to Menu!"
        main_menu
    fi
    echo "1. ${CCB}Download from Github and Install${WC}"
    echo "2. ${CCB}Install Plugin from directory${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter inpur : "
    read -r installPlugin_Input
    case $installPlugin_Input in
        "1" ) installPlugin_Download;;
        "2" ) installPlugin_from_directory;;
        "0" ) main_menu;;
        * ) echo "${RC}Wrong input!${WC}"; sleep 1s; installPlugin;;
    esac
}