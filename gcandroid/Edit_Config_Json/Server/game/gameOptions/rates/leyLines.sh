edit_configjson_Server_game_gameOptions_rates_leyLines() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions_rates"
    echo
    echo -n "${CCB}Enter custom leyLines : ${YC}"
    read -r edit_configjson_Server_game_gameOptions_rates_leyLines_input
    if [[ $edit_configjson_Server_game_gameOptions_rates_leyLines_input == "" ]]; then
        edit_configjson_Server_game_gameOptions_rates
    else
        editJsonJq "server.game.gameOptions.rates.leyLines=$edit_configjson_Server_game_gameOptions_rates_leyLines_input"
    fi
}