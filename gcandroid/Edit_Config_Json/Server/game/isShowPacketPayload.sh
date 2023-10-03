edit_configjson_Server_game_isShowPacketPayload() {
    editConfigJson_Back="edit_configjson_Server_game"
    if [[ $server_game_isShowPacketPayload == "true" ]]; then
        editJsonJq "server.game.isShowPacketPayload=false"
    elif [[ $server_game_isShowPacketPayload == "false" ]]; then
        editJsonJq "server.game.isShowPacketPayload=true"
    fi
}