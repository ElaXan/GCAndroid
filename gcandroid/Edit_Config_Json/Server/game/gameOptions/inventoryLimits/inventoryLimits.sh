edit_configjson_Server_game_gameOptions_inventoryLimits() {
    credit_hah
    line1 "Edit config.json [inventoryLimits]"
    getConfigJson "server.game.gameOptions.inventoryLimits"
    echo "1. [${GC}$server_game_gameOptions_inventoryLimits_weapons${WC}] weapons"
    echo "2. [${GC}$server_game_gameOptions_inventoryLimits_relics${WC}] relics"
    echo "3. [${GC}$server_game_gameOptions_inventoryLimits_materials${WC}] materials"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_Server_game_gameOptions_inventoryLimits_input
    case $edit_configjson_Server_game_gameOptions_inventoryLimits_input in
    "1") edit_configjson_Server_game_gameOptions_inventoryLimits_weapons ;;
    "2") edit_configjson_Server_game_gameOptions_inventoryLimits_relics ;;
    "3") edit_configjson_Server_game_gameOptions_inventoryLimits_materials ;;
    "0") edit_configjson_Server_game_gameOptions ;;
    *)
        echo "${RC}Wrong Input${WC}"
        sleep 0.5s
        edit_configjson_Server_game_gameOptions_inventoryLimits
        ;;
    esac
}
