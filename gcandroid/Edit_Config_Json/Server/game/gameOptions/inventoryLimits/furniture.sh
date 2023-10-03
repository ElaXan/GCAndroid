edit_configjson_Server_game_gameOptions_inventoryLimits_furniture() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions_inventoryLimits"
    echo
    echo -n "${CCB}Enter custom furniture : ${YC}"
    read -r edit_configjson_Server_game_gameOptions_inventoryLimits_furniture_input
    echo -n "${WC}"
    if [[ $edit_configjson_Server_game_gameOptions_inventoryLimits_furniture_input == "" ]]; then
        edit_configjson_Server_game_gameOptions_inventoryLimits
    else
        editJsonJq "server.game.gameOptions.inventoryLimits.furniture=$edit_configjson_Server_game_gameOptions_inventoryLimits_furniture_input"
    fi
}