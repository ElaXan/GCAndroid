edit_configjson_Server_game_gameOptions_resinOptions() {
    credit_hah
    line3 "Edit config.json [resinOptions]"
    getConfigJson "server.game.gameOptions.resinOptions"
    echo "1. [$server_game_gameOptions_resinOptions_resinUsageOut] resinUsage"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_Server_game_gameOptions_resinOptions_input
    case $edit_configjson_Server_game_gameOptions_resinOptions_input in
    "1") edit_configjson_Server_game_gameOptions_resinOptions_resinUsage ;;
    "0") edit_configjson_Server_game_gameOptions ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 0.5s
        edit_configjson_Server_game_gameOptions_resinOptions
        ;;
    esac
}
