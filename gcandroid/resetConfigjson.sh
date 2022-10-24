reset_configjson() {
    if [ ! -d "$HOME/Grasscutter" ]; then
        echo "${RC}Error${WC} : $HOME/Grasscutter not found"
        echo
        read -p "Press enter for back to Menu!"
        main_menu
        return
    fi
    if [ ! -f "$wherethegrassss" ]; then
        echo "${RC}Error${WC} : $wherethegrassss not found"
        echo
        read -p "Press enter for back to Menu!"
        main_menu
        return
    fi
    if [ -f "$configpath" ]; then
        rm $configpath
    fi
    cd $HOME/Grasscutter || exit 1
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
    run_Program() {
        timeout --foreground 5s java -jar grasscutter.jar &>$HOME/zerr.log
        errCode=$?
        log "$errCode"
    }
    run_Program &
    pid=$!
    spin "${GC}Reset config.json${WC}" "124" "Menu" "main_menu"
    echo
    read -p "Press enter for back to edit config.json"
    menu_config
    return
}
