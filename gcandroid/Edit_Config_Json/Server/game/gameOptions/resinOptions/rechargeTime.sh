edit_configjson_Server_game_gameOptions_resinOptions_rechargeTime() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions_resinOptions"
    echo
    echo -n "${CCB}Enter custom rechargeTime : ${YC}"
    read -r edit_configjson_Server_game_gameOptions_resinOptions_rechargeTime_input
    echo -n "${WC}"
    if [[ $edit_configjson_Server_game_gameOptions_resinOptions_rechargeTime_input == "" ]]; then
        edit_configjson_Server_game_gameOptions_resinOptions
    else
        editJsonJq "server.game.gameOptions.resinOptions.rechargeTime=$edit_configjson_Server_game_gameOptions_resinOptions_rechargeTime_input"
    fi
}