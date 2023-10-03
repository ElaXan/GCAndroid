edit_configjson_database_game_connectionUri() {
    editConfigJson_Back="edit_configjson_database_game"
    echo
    echo -n "${CCB}Enter custom connectionUri : ${YC}"
    read -r connectionUri
    echo -n "${WC}"
    if [[ -z $connectionUri ]]; then
        edit_configjson_database_game
    else
        editJsonJq "databaseInfo.game.connectionUri=\"$connectionUri\""
    fi
}