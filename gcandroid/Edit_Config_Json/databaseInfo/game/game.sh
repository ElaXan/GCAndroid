edit_configjson_database_game() {
    credit_hah
    Center_Text "Edit config.json [Game]"
    getConfigJson "databaseInfo.game"
    echo "1. [${GC}$databaseInfo_game_connectionUri${WC}] connectionUri"
    echo "2. [${GC}$databaseInfo_game_collection${WC}] collection"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_database_game_input
    case $edit_configjson_database_game_input in
        1)
            edit_configjson_database_game_connectionUri
            ;;
        2)
            edit_configjson_database_game_collection
            ;;
        0)
            edit_configjson_database
            ;;
        *)
            echo -e "${RC}Invalid input!${WC}"
            sleep 0.5s
            edit_configjson_database_game
            ;;
    esac
}