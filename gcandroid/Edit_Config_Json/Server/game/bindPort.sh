edit_configjson_Server_game_bindPort() {
    editConfigJson_Back="edit_configjson_Server_game"
    echo
    echo -n "${CCB}Enter custom bindPort : ${YC}"
    read -r edit_configjson_Server_game_bindPort_input
    echo -n "${WC}"
    if [[ $edit_configjson_Server_game_bindPort_input = "" ]]; then
        edit_configjson_Server_game
    else
        editJsonJq "server.game.bindPort=$edit_configjson_Server_game_bindPort_input"
    fi
}