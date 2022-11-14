edit_configjson_Server_game_enableConsole() {
    editConfigJson_Back="edit_configjson_Server_game"
    if [[ $server_game_enableConsole == "true" ]]; then
        editJsonJq "server.game.enableConsole=false"
    elif [[ $server_game_enableConsole == "false" ]]; then
        editJsonJq "server.game.enableConsole=true"
    fi
}