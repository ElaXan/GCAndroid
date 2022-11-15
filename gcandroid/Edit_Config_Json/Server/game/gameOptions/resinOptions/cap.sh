edit_configjson_Server_game_gameOptions_resinOptions_cap() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions_resinOptions"
    echo
    echo -n "${CCB}Enter custom cap : ${YC}"
    read -r edit_configjson_Server_game_gameOptions_resinOptions_cap_input
    if [[ $edit_configjson_Server_game_gameOptions_resinOptions_cap_input == "" ]]; then
        edit_configjson_Server_game_gameOptions_resinOptions
    else
        editJsonJq "server.game.gameOptions.resinOptions.cap=$edit_configjson_Server_game_gameOptions_resinOptions_cap_input"
    fi
}