edit_configjson_Server_game_gameOptions_sceneEntityLimit() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions"
    echo
    echo -n "${CCB}Enter custom sceneEntityLimit : ${YC}"
    read -r edit_configjson_Server_game_gameOptions_sceneEntityLimit_input
    if [[ $edit_configjson_Server_game_gameOptions_sceneEntityLimit_input == "" ]]; then
        edit_configjson_Server_game_gameOptions
    else
        editJsonJq "server.game.gameOptions.sceneEntityLimit=$edit_configjson_Server_game_gameOptions_sceneEntityLimit_input"
    fi
}