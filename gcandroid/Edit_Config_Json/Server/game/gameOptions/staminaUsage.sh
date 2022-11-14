edit_configjson_Server_game_gameOptions_staminaUsage() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions"
    if [[ $server_game_gameOptions_staminaUsage == "true" ]]; then
        editJsonJq "server.game.gameOptions.staminaUsage=false"
    elif [[ $server_game_gameOptions_staminaUsage == "false" ]]; then
        editJsonJq "server.game.gameOptions.staminaUsage=true"
    fi
}