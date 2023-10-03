edit_configjson_Server_game_gameOptions_inventoryLimits_materials() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions_inventoryLimits"
    echo
    echo -n "${CCB}Enter custom materials : ${YC}"
    read -r edit_configjson_Server_game_gameOptions_inventoryLimits_materials_input
    if [[ $edit_configjson_Server_game_gameOptions_inventoryLimits_materials_input == "" ]]; then
        edit_configjson_Server_game_gameOptions_inventoryLimits
    else
        editJsonJq "server.game.gameOptions.inventoryLimits.materials=$edit_configjson_Server_game_gameOptions_inventoryLimits_materials_input"
    fi
}