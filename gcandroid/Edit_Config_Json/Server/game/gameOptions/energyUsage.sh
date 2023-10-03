edit_configjson_Server_game_gameOptions_energyUsage() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions"
    if [[ $server_game_gameOptions_energyUsage == "false" ]]; then
        editJsonJq "server.game.gameOptions.energyUsage=true"
    elif [[ $server_game_gameOptions_energyUsage == "true" ]]; then
        editJsonJq "server.game.gameOptions.energyUsage=false"
    fi
}