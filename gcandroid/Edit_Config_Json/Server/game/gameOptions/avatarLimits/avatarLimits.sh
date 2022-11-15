edit_configjson_Server_game_gameOptions_avatarLimits() {
    credit_hah
    line3 "Edit config.json [avatarLimits]"
    getConfigJson "server.game.gameOptions.avatarLimits"
    echo "1. [${GC}$server_game_gameOptions_avatarLimits_singlePlayerTeam${WC}] singlePlayerTeam"
    echo "2. [${GC}$server_game_gameOptions_avatarLimits_multiplayerTeam${WC}] multiplayerTeam"
    echo "0. ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_Server_game_gameOptions_avatarLimits_input
    case $edit_configjson_Server_game_gameOptions_avatarLimits_input in
    "1") edit_configjson_Server_game_gameOptions_avatarLimits_singlePlayerTeam ;;
    "2") edit_configjson_Server_game_gameOptions_avatarLimits_multiplayerTeam ;;
    "0") edit_configjson_Server_game_gameOptions ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 0.5s
        edit_configjson_Server_game_gameOptions_avatarLimits
        ;;
    esac
}
