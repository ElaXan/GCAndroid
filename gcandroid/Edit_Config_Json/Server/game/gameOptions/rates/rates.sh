edit_configjson_Server_game_gameOptions_rates() {
    credit_hah
    line5 "Edit config.json [rates]"
    getConfigJson "server.game.gameOptions.rates"
    echo "1. [${GC}$server_game_gameOptions_rates_adventureExp${WC}] adventureExp"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_Server_game_gameOptions_rates_input
    case $edit_configjson_Server_game_gameOptions_rates_input in
    "1") edit_configjson_Server_game_gameOptions_rates_adventureExp ;;
    "0") edit_configjson_Server_game_gameOptions ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 0.5s
        edit_configjson_Server_game_gameOptions_rates
        ;;
    esac
}
