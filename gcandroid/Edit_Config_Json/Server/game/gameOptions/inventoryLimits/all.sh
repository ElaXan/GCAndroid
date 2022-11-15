edit_configjson_Server_game_gameOptions_inventoryLimits_all() {
    editConfigJson_Back="edit_configjson_Server_game_gameOptions_inventoryLimits"
    echo
    echo -n "${CCB}Enter custom all : ${YC}"
    read -r edit_configjson_Server_game_gameOptions_inventoryLimits_all_input
    echo -n "${WC}"
    if [[ $edit_configjson_Server_game_gameOptions_inventoryLimits_all_input == "" ]]; then
        edit_configjson_Server_game_gameOptions_inventoryLimits
    else
        editJsonJq "server.game.gameOptions.inventoryLimits.all=$edit_configjson_Server_game_gameOptions_inventoryLimits_all_input"
    fi
}