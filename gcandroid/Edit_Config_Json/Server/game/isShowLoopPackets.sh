edit_configjson_Server_game_isShowLoopPackets() {
    editConfigJson_Back="edit_configjson_Server_game"
    if [[ $server_game_isShowLoopPackets == "true" ]]; then
        editJsonJq "server.game.isShowLoopPackets=false"
    elif [[ $server_game_isShowLoopPackets == "false" ]]; then
        editJsonJq "server.game.isShowLoopPackets=true"
    fi
}