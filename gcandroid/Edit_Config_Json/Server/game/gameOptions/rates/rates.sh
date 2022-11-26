edit_configjson_Server_game_gameOptions_rates() {
    credit_hah
    Center_Text "Edit config.json [rates]"
    getConfigJson "server.game.gameOptions.rates"
    echo "1. [${GC}$server_game_gameOptions_rates_adventureExp${WC}] adventureExp"
    echo "2. [${GC}$server_game_gameOptions_rates_mora${WC}] mora"
    echo "3. [${GC}$server_game_gameOptions_rates_leyLines${WC}] leyLines"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_Server_game_gameOptions_rates_input
    case $edit_configjson_Server_game_gameOptions_rates_input in
    "1") edit_configjson_Server_game_gameOptions_rates_adventureExp ;;
    "2") edit_configjson_Server_game_gameOptions_rates_mora ;;
    "3") edit_configjson_Server_game_gameOptions_rates_leyLines ;;
    "0") edit_configjson_Server_game_gameOptions ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 0.5s
        edit_configjson_Server_game_gameOptions_rates
        ;;
    esac
}
