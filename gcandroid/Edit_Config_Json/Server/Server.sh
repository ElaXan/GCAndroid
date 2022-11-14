edit_configjson_Server_main() {
    credit_hah
    cd $HOME/Grasscutter || exit 1
    getConfigJson "Server"
    line6 "Edit config.json [SERVER]"
    echo "1. [$logCommandsOut] logCommand"
    echo "2. [$runModeOut] runMode"
    echo "3. ${CCB}http${WC}"
    echo "4. ${CCB}game${WC}"
    echo
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_main_input
    case $edit_configjson_main_input in
    "1") edit_configjson_Server_logcommands ;;
    "2") edit_configjson_Server_runMode ;;
    "3") edit_configjson_Server_http ;;
    "4") edit_configjson_Server_game ;;
    "0") main_menu ;;
    *)
        echo "${RC}Wrong input!${WC}"
        sleep 1s
        edit_configjson_Server_main
        ;;
    esac
}
