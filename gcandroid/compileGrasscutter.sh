Compile_Grasscutter() {
    Grasscutter_Folder=$HOME/Grasscutter
    if [ ! -d "$Grasscutter_Folder" ]; then
        echo "${RC}Error${WC} : $Grasscutter_Folder not found"
        echo
        read -p "Press enter for back to Menu Grasscutter"
        menu_Grasscutter
        return
    fi
    clear
    credit_hah
    cd $HOME/Grasscutter || exit 1
    if [ -f "grasscutter.jar" ]; then
        rm grasscutter.jar
    fi
    run_Program() {
        ./gradlew jar &>$HOME/zerr.log
        errCode=$?
        log "$errCode"
    }
    run_Program &
    pid=$!
    spin "${GC}Compiling jar${WC}" "Menu" "main_menu"
    GrasscutterJar=$(ls grasscutter*.jar)
    if [ ! $GrasscutterJar ]; then
        echo "${RC}Error${WC} : Failed compile jar${WC}"
        echo
        read -p "Press enter for back to Menu Grasscutter!"
        menu_Grasscutter
    else
        mv grasscutter*.jar grasscutter.jar
        echo "${GC}Success compile jar and output to $HOME/Grasscutter folder"
        echo "With name grasscutter.jar${WC}"
        echo
        read -p "Press enter for back to Menu Graascutter!"
        menu_Grasscutter
    fi
}
