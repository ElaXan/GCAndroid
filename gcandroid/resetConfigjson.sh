# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

reset_configjson() {
    if [ ! -d "$grasscutter_path" ]; then
        echo "${RC}Error${WC} : $grasscutter_path not found"
        echo "See : ${CCU}${linksDocs}/Error#error--grasscutter-directory-not-found${WC}"
        echo
        read -p "Press enter for back to Menu!"
        main_menu
        return
    fi
    if [ ! -f "$wherethegrassss" ]; then
        echo "${RC}Error${WC} : $wherethegrassss not found"
        echo "See : ${CCU}${linksDocs}/Error#error--grasscutterjar-not-found${WC}"
        echo
        read -p "Press enter for back to Menu!"
        main_menu
        return
    fi
    cd $grasscutter_path || exit 1
    clear
    credit_hah
    echo "${YC}Are you sure want to reset config.json?"
    echo
    read -p "${WC}Enter input (y/N) : ${CCB}" reset_configjson_input
    echo -n "${WC}"
    case $reset_configjson_input in
    "y" | "Y") echo -n ;;
    "n" | "N") menu_config ;;
    *)
        echo "${RC}Wrong input!${WC}"
        sleep 1s
        reset_configjson
        ;;
    esac
    clear
    credit_hah
    if [ -f "$configpath" ]; then
        rm $configpath
    fi
    Run "timeout --foreground 5s java -jar grasscutter.jar" "Reset config.json" "124" "Menu" "main_menu"
    echo
    read -p "Press enter for back to edit config.json"
    menu_config
    return
}
