edit_configjson_Server_game_gameOptions_avatarLimits_singlePlayerTeam() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions_avatarLimits"
    echo
    echo -n "${CCB}Enter custom singlePlayerTeam : ${YC}"
    read -r edit_configjson_Server_game_gameOptions_avatarLimits_singlePlayerTeam_input
    if [[ $edit_configjson_Server_game_gameOptions_avatarLimits_singlePlayerTeam_input == "" ]]; then
        edit_configjson_Server_game_gameOptions_avatarLimits
    else
        editJsonJq "server.game.gameOptions.avatarLimits.singlePlayerTeam=$edit_configjson_Server_game_gameOptions_avatarLimits_singlePlayerTeam_input"
    fi
}