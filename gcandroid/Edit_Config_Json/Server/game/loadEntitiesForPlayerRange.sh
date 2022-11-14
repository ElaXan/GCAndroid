edit_configjson_Server_game_loadEntitiesForPlayerRange() {
    editConfigJson_Back="edit_configjson_Server_game"
    echo
    echo -n "${CCB}Enter custom loadEntitiesForPlayerRange : ${YC}"
    read -r edit_configjson_Server_game_loadEntitiesForPlayerRange_input
    echo "${WC}"
    if [[ $edit_configjson_Server_game_loadEntitiesForPlayerRange_input == "" ]]; then
        edit_configjson_Server_game
    else
        editJsonJq "server.game.loadEntitiesForPlayerRange=$edit_configjson_Server_game_loadEntitiesForPlayerRange_input"
    fi
}