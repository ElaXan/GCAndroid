edit_configjson_Server_game_enableScriptInBigWorld() {
    editConfigJson_Back="edit_configjson_Server_game"
    if [[ $server_game_enableScriptInBigWorld == "true" ]]; then
        editJsonJq "server.game.enableScriptInBigWorld=false"
    elif [[ $server_game_enableScriptInBigWorld == "false" ]]; then
        editJsonJq "server.game.enableScriptInBigWorld=true"
    fi
}