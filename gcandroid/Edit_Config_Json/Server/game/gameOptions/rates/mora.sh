edit_configjson_Server_game_gameOptions_rates_mora() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions_rates"
    echo
    echo -n "${CCB}Enter custom mora : ${YC}"
    read -r edit_configjson_Server_game_gameOptions_rates_mora_input
    echo -n "${WC}"
    if [[ $edit_configjson_Server_game_gameOptions_rates_mora_input == "" ]]; then
        edit_configjson_Server_game_gameOptions_rates
    else
        editJsonJq "server.game.gameOptions.rates.mora=$edit_configjson_Server_game_gameOptions_rates_mora_input"
    fi
}