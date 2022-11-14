edit_configjson_Server_game_kcpInterval() {
    editConfigJson_Back="edit_configjson_Server_game"
    echo
    echo -n "${CCB}Enter custom kcpInterval : ${YC}"
    read -r edit_configjson_Server_game_kcpInterval_input
    echo -n "${WC}"
    if [[ $edit_configjson_Server_game_kcpInterval_input == "" ]]; then
        edit_configjson_Server_game
    else
        editJsonJq "server.game.kcpInterval=$edit_configjson_Server_game_kcpInterval_input"
    fi
}