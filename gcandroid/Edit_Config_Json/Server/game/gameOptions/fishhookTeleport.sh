edit_configjson_Server_game_gameOptions_fishhookTeleport() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions"
    if [[ $server_game_gameOptions_fishhookTeleport == "true" ]]; then
        editJsonJq "server.game.gameOptions.fishhookTeleport=false"
    elif [[ $server_game_gameOptions_fishhookTeleport == "false" ]]; then
        editJsonJq "server.game.gameOptions.fishhookTeleport=true"
    fi
}