edit_configjson_Server_game_gameOptions_inventoryLimits() {
    credit_hah
    line1 "Edit config.json [inventoryLimits]"
    getConfigJson "server.game.gameOptions.inventoryLimits"
    echo "1. [${GC}$server_game_gameOptions_inventoryLimits_weapons${WC}] weapons"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_Server_game_gameOptions_inventoryLimits_input
    case $edit_configjson_Server_game_gameOptions_inventoryLimits_input in
    "1") edit_configjson_Server_game_gameOptions_inventoryLimits_weapons ;;
    "0") edit_configjson_Server_game_gameOptions ;;
    *)
        echo "${RC}Wrong Input${WC}"
        sleep 0.5s
        edit_configjson_Server_game_gameOptions_inventoryLimits
        ;;
    esac
}
