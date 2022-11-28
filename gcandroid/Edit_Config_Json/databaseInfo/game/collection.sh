edit_configjson_database_game_collection() {
    editConfigJson_Back="edit_configjson_database_game"
    echo
    echo -n "${CCB}Enter custom collection : ${YC}"
    read -r edit_configjson_database_game_collection_input
    echo -n "${WC}"
    if [[ -z $edit_configjson_database_game_collection_input ]]; then
        echo -e "${RC}Invalid input!${WC}"
        sleep 0.5s
        edit_configjson_database_game_collection
    else
        editJsonJq "databaseInfo.game.collection=\"$edit_configjson_database_game_collection_input\""
    fi
}