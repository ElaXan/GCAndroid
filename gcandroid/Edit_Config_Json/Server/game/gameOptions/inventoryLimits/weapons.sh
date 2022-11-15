edit_configjson_Server_game_gameOptions_inventoryLimits_weapons() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions_inventoryLimits"
    echo
    echo -n "${CCB}Enter custom weapons : ${YC}"
    read -r edit_configjson_Server_game_gameOptions_inventoryLimits_weapons_input
    echo -n "${WC}"
    if [[ $edit_configjson_Server_game_gameOptions_inventoryLimits_weapons_input == "" ]]; then
        edit_configjson_Server_game_gameOptions_inventoryLimits
    else
        editJsonJq "server.game.gameOptions.inventoryLimits.weapons=$edit_configjson_Server_game_gameOptions_inventoryLimits_weapons_input"
    fi
}