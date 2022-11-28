edit_configjson_database() {
    credit_hah
    Center_Text "Edit config.json [Database]"
    echo "1. ${CCB}Game${WC}"
    echo "2. ${CCB}Server${WC}"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_database_input
    case $edit_configjson_database_input in
        1)
            edit_configjson_database_game
            ;;
        2)
            edit_configjson_database_server
            ;;
        0)
            edit_configjson
            ;;
        *)
            echo -e "${RC}Invalid input!${WC}"
            sleep 0.5s
            edit_configjson_database
            ;;
    esac
}