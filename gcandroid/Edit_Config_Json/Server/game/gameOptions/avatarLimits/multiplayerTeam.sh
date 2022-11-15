edit_configjson_Server_game_gameOptions_avatarLimits_multiplayerTeam() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions_avatarLimits"
    echo
    echo -n "${CCB}Enter custom multiplayerTeam : ${YC}"
    read -r edit_configjson_Server_game_gameOptions_avatarLimits_multiplayerTeam_input
    echo -n "${WC}"
    if [[ $edit_configjson_Server_game_gameOptions_avatarLimits_multiplayerTeam_input == "" ]]; then
        edit_configjson_Server_game_gameOptions_avatarLimits
    else
        editJsonJq "server.game.gameOptions.avatarLimits.multiplayerTeam=$edit_configjson_Server_game_gameOptions_avatarLimits_multiplayerTeam_input"
    fi
}