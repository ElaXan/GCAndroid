installPlugin_Download() {
    credit_hah
    echo "${YC}Enter b/B for back${WC}"
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
    folderNamePlugin=$HOME/PluginsGC
    if [ -d "$folderNamePlugin" ]; then
        rm -rf $folderNamePlugin
        mkdir $folderNamePlugin
    fi
    if [ ! -d "$folderNamePlugin" ]; then
        mkdir $folderNamePlugin
    fi
    cd $folderNamePlugin
    run_Program() { wget $installPlugin_Download_Link &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "${GC}Download .jar plugin${WC}" "0" "Plugins Menu" "installPlugin"
    getNamePlugin=$(ls $folderNamePlugin | sed "s/.*\///g")
    if [ ! -d "$HOME/Grasscutter/plugins" ]; then
        mkdir "$HOME/Grasscutter/plugins"
    fi
    if [[ $(echo "$getNamePlugin" | sed "s/.*\.//g") != "jar" ]]; then
        echo "${RC}Cannot continue because $getNamePlugin not .jar file!${WC}"
        echo
        rm -rf $folderNamePlugin
        read -p "Press enter for back to Menu!"
        main_menu
        return
    fi
    if [ -f "$HOME/Grasscutter/plugins/$getNamePlugin" ]; then
        echo "${YC}Failed to install because $getNamePlugin already installed${WC}"
        echo
        echo -n "Press enter for back to Plugin Menu!"
        rm -rf $folderNamePlugin
        read
        installPlugin
        return
    fi
    run_Program() { cp $folderNamePlugin/$getNamePlugin $HOME/Grasscutter/plugins/$getNamePlugin &> $HOME/zerr.log; errCode=$?; log "$errCode"; }
    run_Program & pid=$!
    spin "${GC}Installing .jar plugin${WC}" "0" "Plugins Menu" "installPlugin"
    if [ -f "$HOME/Grasscutter/plugins/${getNamePlugin}" ]; then
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
    echo "${YC}Enter b/B for back${WC}"
    echo
    echo "${CCB}Please enter where .jar plugin${WC}"
    echo -n "${GC}Path : ${WC}"
    read -r installPlugin_from_directory_Input
    if [[ $installPlugin_from_directory_Input == "" ]]; then
        echo "${RC}Please enter path!${WC}"
        sleep 1s
        installPlugin_from_directory
        return
    elif [[ $installPlugin_from_directory_Input == "b" ]] || [[ $installPlugin_from_directory_Input == "B" ]]; then
        installPlugin
        return
    fi
    if ! [ -f "$installPlugin_from_directory_Input" ]; then 
        echo "${RC}.jar not found! in ${installPlugin_from_directory_Input}${WC}"
        sleep 1.5s
        installPlugin_from_directory
        return
    else
        if ! [ $(ls $installPlugin_from_directory_Input | sed "s/.*\.//g") == "jar" ]; then
            echo "${RC}Cannot continue because $installPlugin_from_directory_Input not .jar file!${WC}"
            echo
            read -p "Press enter for back to Menu!"
            main_menu
            return
        else
            cp "$installPlugin_from_directory_Input" $HOME/Grasscutter/plugins &>/dev/null
        fi
        getNamePlugin=$(ls $installPlugin_from_directory_Input | sed "s/.*\///g")
        if [[ ! -f "$HOME/Grasscutter/plugins/$(echo $installPlugin_from_directory_Input | sed "s/.*\///g")" ]]; then
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
    if ! [ -d "$HOME/Grasscutter" ]; then
        echo "${RC}$HOME/Grasscutter is not found!${WC}"
        echo
        read -p "Press enter for back to Menu!"
        main_menu
    fi
    echo "1. ${CCB}Download plugin and Install${WC}"
    echo "2. ${CCB}Install Plugin from local directory${WC}"
    echo "0. ${RC}Back${WC}"
    echo -n "Enter inpur : "
    read -r installPlugin_Input
    case $installPlugin_Input in
        "1" ) installPlugin_Download;;
        "2" ) installPlugin_from_directory;;
        "0" ) main_menu;;
        * ) echo "${RC}Wrong input!${WC}"; sleep 1s; installPlugin;;
    esac
}