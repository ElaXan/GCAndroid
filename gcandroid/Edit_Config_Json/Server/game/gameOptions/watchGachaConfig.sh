edit_configjson_Server_game_gameOptions_watchGachaConfig() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions"
    if [[ $server_game_gameOptions_watchGachaConfig == "true" ]]; then
        editJsonJq "server.game.gameOptions.watchGachaConfig=false"
    elif [[ $server_game_gameOptions_watchGachaConfig == "false" ]]; then
        editJsonJq "server.game.gameOptions.watchGachaConfig=true"
    fi
}