edit_configjson_Server_game_gameOptions_resinOptions_resinUsage() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions_resinOptions"
    if [[ $server_game_gameOptions_resinOptions_resinUsage == "false" ]]; then
        editJsonJq "server.game.gameOptions.resinOptions.resinUsage=true"
    elif [[ $server_game_gameOptions_resinOptions_resinUsage == "true" ]]; then
        editJsonJq "server.game.gameOptions.resinOptions.resinUsage=false"
    fi
}