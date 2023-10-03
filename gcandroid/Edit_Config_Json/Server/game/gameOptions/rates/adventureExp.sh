edit_configjson_Server_game_gameOptions_rates_adventureExp() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions_rates"
    echo
    echo -n "${CCB}Enter custom adventureExp : ${YC}"
    read -r edit_configjson_Server_game_gameOptions_rates_adventureExp_input
    echo -n "${WC}"
    if [[ $edit_configjson_Server_game_gameOptions_rates_adventureExp_input == "" ]]; then
        edit_configjson_Server_game_gameOptions_rates
    else
        editJsonJq "server.game.gameOptions.rates.adventureExp=$edit_configjson_Server_game_gameOptions_rates_adventureExp_input"
    fi
}