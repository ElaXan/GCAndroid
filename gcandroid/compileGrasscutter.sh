# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

Compile_Grasscutter() {
    if [ ! -d "$grasscutter_path" ]; then
        echo "${RC}Error${WC} : $grasscutter_path not found"
        echo "See : ${CCU}${linksDocs}/Error#error--grasscutter-directory-not-found${WC}"
        echo
        read -p "Press enter for back to Menu Grasscutter"
        Grasscutter_Menu
        return
    fi
    if [ ! -f "$grasscutter_path/gradlew" ]; then
        echo "${RC}Error${WC} : gradlew not found!"
        echo "See : ${CCU}${linksDocs}/Error#error--grasscutter-gradlew-file-not-found${WC}"
        echo
        read -p "Press enter for back to Menu Grasscutter"
        Grasscutter_Menu
        return
    fi
    clear
    credit_hah
    Center_Text "Compile .jar [PLEASE WAIT]"
    cd $grasscutter_path || exit 1
    if [ -f "grasscutter.jar" ]; then
        rm grasscutter.jar
    fi
    Run "./gradlew jar" "Compiling grasscutter.jar" "0" "Menu" "main_menu"
    GrasscutterJar=$(ls grasscutter*.jar)
    if [ ! $GrasscutterJar ]; then
        echo "${RC}Error${WC} : Failed compile jar${WC}"
        echo
        read -p "Press enter for back to Menu Grasscutter!"
        Grasscutter_Menu
    else
        mv grasscutter*.jar grasscutter.jar
        echo "${GC}Success compile jar and output to $grasscutter_path folder"
        echo "With name grasscutter.jar${WC}"
        echo
        read -p "Press enter for back to Menu Grasscutter!"
        Grasscutter_Menu
    fi
}
