# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

installPlugin_Download() {
    credit_hah
    Center_Text "Install Plugin Download"
    echo "${YC}Enter b/B for back${WC}"
    echo
    echo -n "${GC}Enter link Download .jar : ${WC}"
    read -r installPlugin_Download_Link
    if [[ $installPlugin_Download_Link == "" ]]; then
        echo "${RC}Please enter link!${WC}"
        sleep 1s
        installPlugin_Download
    elif [[ $installPlugin_Download_Link == "b" ]] || [[ $installPlugin_Download_Link == "B" ]]; then
        installPlugin
    fi
    folderNamePlugin=$HOME/PluginsGC
    if [ -d "$folderNamePlugin" ]; then
        rm -rf $folderNamePlugin
        mkdir $folderNamePlugin
    fi
    if [ ! -d "$folderNamePlugin" ]; then
        mkdir $folderNamePlugin
    fi
    cd $folderNamePlugin
    Run "wget $installPlugin_Download_Link" "Download .jar plugin" "0" "Plugins Menu" "installPlugin"
    getNamePlugin=$(ls $folderNamePlugin | sed "s/.*\///g")
    if [ ! -d "$grasscutter_path/plugins" ]; then
        mkdir "$grasscutter_path/plugins"
    fi
    if [[ $(echo "$getNamePlugin" | sed "s/.*\.//g") != "jar" ]]; then
        echo "${RC}Cannot continue because $getNamePlugin not .jar file!${WC}"
        echo
        rm -rf $folderNamePlugin
        read -p "Press enter for back to Menu!"
        main_menu
        return
    fi
    if [ -f "$grasscutter_path/plugins/$getNamePlugin" ]; then
        echo "${YC}Failed to install because $getNamePlugin already installed${WC}"
        echo
        echo -n "Press enter for back to Plugin Menu!"
        rm -rf $folderNamePlugin
        read
        installPlugin
        return
    fi
    Run "cp $folderNamePlugin/$getNamePlugin $grasscutter_path/plugins/" "Installing .jar plugin" "0" "Plugins Menu" "installPlugin"
    if [ -f "$grasscutter_path/plugins/${getNamePlugin}" ]; then
        echo "${GC}Install plugin ${getNamePlugin} success!${WC}"
        echo
        rm -rf $folderNamePlugin
        echo -n "Press enter for back to Menu!"
        read
        main_menu
        return
    else
        echo "${RC}Install plugin ${getNamePlugin} failed!${WC}"
        echo
        rm -rf $folderNamePlugin
        echo -n "Press enter for back to Menu!"
        read
        main_menu
        return
    fi
}

installPlugin_from_directory() {
    credit_hah
    Center_Text "Install Plugin Directory"
    echo "1. ${CCB}Using dialog command${WC}"
    echo "2. ${CCB}Manual Typing${WC}"
    echo "3. ${CCB}Help for Dialog command${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r installPlugin_from_directory_input
    case $installPlugin_from_directory_input in
    "1")
        installPlugin_from_directory_Input="1"
        installPlugin_from_directory_process
        ;;
    "2")
        installPlugin_from_directory_Input="2"
        installPlugin_from_directory_process
        ;;
    "3")
        credit_hah
        echo "${YC}1. ${CCB}Space on your keyboard for select file!${WC}"
        echo "${YC}2. ${CCB}Use ↑, ↓, ←, → for interaction!${WC}"
        echo "${YC}3. ${CCB}Enter on your keyboard to continue if the choice is correct${WC}"
        echo
        echo -n "Press enter for back!"
        read
        installPlugin_from_directory
        ;;
    "0") installPlugin ;;
    *)
        echo "${RC}Wrong input!${WC}"
        sleep 1s
        installPlugin_from_directory
        ;;
    esac
}

installPlugin_from_directory_process() {
    if [[ $installPlugin_from_directory_Input == "1" ]]; then
        FILE=$(dialog --stdout --title "Please choose a .jar plugin" --fselect /sdcard/ 14 48)
        clear
        installPlugin_from_directory_Input_File=$FILE
        fileSearchDialog=true
        # echo "$installPlugin_from_directory_Input_File"
        # exit
        credit_hah
        Center_Text "Install Plugin Directory"
    elif [[ $installPlugin_from_directory_Input == "2" ]]; then
        credit_hah
        Center_Text "Install Plugin Directory"
        echo "${YC}Enter b/B for back${WC}"
        echo
        echo "${CCB}Please enter where .jar plugin${WC}"
        echo
        echo -n "${GC}Path : ${WC}"
        read -r installPlugin_from_directory_Input_File
    else
        echo "${RC}Wrong input!${WC}"
        sleep 1s
        installPlugin_from_directory
        return
    fi
    if [[ $installPlugin_from_directory_Input_File == "" ]]; then
        if [[ $fileSearchDialog = true ]]; then
            echo "${RC}Cancel by user${WC}"
            sleep 1s
            installPlugin_from_directory
        else
            echo "${RC}Please enter path!${WC}"
            sleep 1s
            installPlugin_from_directory_process
            return
        fi
    elif [[ $installPlugin_from_directory_Input_File == "b" ]] || [[ $installPlugin_from_directory_Input == "B" ]]; then
        installPlugin_from_directory
        return
    fi
    if ! [ -f "$installPlugin_from_directory_Input_File" ]; then
        echo "${RC}.jar not found! in ${installPlugin_from_directory_Input_File}${WC}"
        sleep 1.5s
        installPlugin_from_directory
        return
    else
        if ! [ "$(ls $installPlugin_from_directory_Input_File | sed "s/.*\.//g")" == "jar" ]; then
            echo "${RC}Cannot continue because $(echo "$installPlugin_from_directory_Input_File" | sed "s/.*\///g") not .jar file!${WC}"
            echo
            read -p "Press enter for back to Menu!"
            main_menu
            return
        else
            cp "$installPlugin_from_directory_Input_File" $grasscutter_path/plugins &>/dev/null
        fi
        getNamePlugin=$(ls $installPlugin_from_directory_Input_File | sed "s/.*\///g")
        if [[ ! -f "$grasscutter_path/plugins/$(echo $installPlugin_from_directory_Input_File | sed "s/.*\///g")" ]]; then
            echo "${RC}Failed install ${getNamePlugin} plugin to Grasscutter Folder!${WC}"
            echo
            read -p "Press enter for back to Menu!"
            main_menu
            return
        else
            echo "${GC}Plugin ${getNamePlugin} success installed!${WC}"
            echo
            read -p "Press enter for back to Menu!"
            main_menu
            return
        fi
    fi
}

installPlugin() {
    credit_hah
    Center_Text "Install Plugin"
    if ! [ -d "$grasscutter_path" ]; then
        echo "${RC}Folder Grasscutter in $grasscutter_path is not found!${WC}"
        echo
        read -p "Press enter for back to Menu Grasscutter Tools"
        Grasscutter_Tools
    fi
    echo "1. ${CCB}Download plugin and Install${WC}"
    echo "2. ${CCB}Install Plugin from local directory${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r installPlugin_Input
    case $installPlugin_Input in
    "1") installPlugin_Download ;;
    "2") installPlugin_from_directory ;;
    "0") Grasscutter_Tools ;;
    *)
        echo "${RC}Wrong input!${WC}"
        sleep 1s
        installPlugin
        ;;
    esac
}
