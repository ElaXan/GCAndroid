edit_configjson_Server_game_gameOptions_inventoryLimits_relics() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions_inventoryLimits"
    echo
    echo -n "${CCB}Enter custom relics : ${YC}"
    read -r edit_configjson_Server_game_gameOptions_inventoryLimits_relics_input
    echo -n "${WC}"
    if [[ $edit_configjson_Server_game_gameOptions_inventoryLimits_relics_input == "" ]]; then
        edit_configjson_Server_game_gameOptions_inventoryLimits
    else
        editJsonJq "server.game.gameOptions.inventoryLimits.relics=$edit_configjson_Server_game_gameOptions_inventoryLimits_relics_input"
    fi
}