edit_configjson_Server_game_accessPort() {
    editConfigJson_Back="edit_configjson_Server_game"
    echo
    echo -n "${CCB}Enter custom accessPort : ${YC}"
    read -r edit_configjson_Server_game_accessPort_input
    if [[ $edit_configjson_Server_game_accessPort_input == "" ]]; then
        edit_configjson_Server_game
    else
        editJsonJq "server.game.accessPort=$edit_configjson_Server_game_accessPort_input"
    fi
}