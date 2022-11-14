edit_configjson_Server_game_gameOptions_enableShopItems() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions"
    if [[ $server_game_gameOptions_enableShopItems == "true" ]]; then
        editJsonJq "server.game.gameOptions.enableShopItems=false"
    elif [[ $server_game_gameOptions_enableShopItems == "false" ]]; then
        editJsonJq "server.game.gameOptions.enableShopItems=true"
    fi
}