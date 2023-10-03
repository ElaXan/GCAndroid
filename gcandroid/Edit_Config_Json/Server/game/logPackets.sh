edit_configjson_Server_game_logPackets() {
    editConfigJson_Back="edit_configjson_Server_game"
    if [[ $server_game_logPackets == "ALL" ]]; then
        editJsonJq "server.game.logPackets=\"NONE\""
    elif [[ $server_game_logPackets == "NONE" ]]; then
        editJsonJq "server.game.logPackets=\"ALL\""
    fi
}