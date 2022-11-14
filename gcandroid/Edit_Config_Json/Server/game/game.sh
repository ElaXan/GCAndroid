edit_configjson_Server_game() {
    credit_hah
    line6 "Edit config.json [GAME]"
    getConfigJson "server.http.game"
    echo "1. [${GC}$server_game_bindAddress${WC}] bindAddress"
    echo "2. [${GC}$server_game_bindPort${WC}] bindPort"
    echo "3. [${GC}$server_game_accessAddress${WC}] accessAddress"
    echo "4. [${GC}$server_game_accessPort${WC}] accessPort"
    echo "5. [${GC}$server_game_loadEntitiesForPlayerRange${WC}] loadEntitiesForPlayerRange"
    echo "6. [${GC}$server_game_enableScriptInBigWorldOut${WC}] enableScriptInBigWorld"
    echo "7. [${GC}$server_game_enableConsoleOut${WC}] enableConsole"
    echo "8. [${GC}$server_game_kcpInterval${WC}] kcpInterval"
    echo "9. [${GC}$server_game_logPackets${WC}] logPackets"
    echo "10. [${GC}$server_game_isShowPacketPayloadOut${WC}] isShowPacketPayload"
    echo "11. [$server_game_isShowLoopPacketsOut] isShowLoopPackets"
    echo "12. ${CCB}gameOptions${WC}"
    echo "0, ${RC}Back${WC}"
    echo
    echo -n "Enter input : "
    read -r edit_configjson_game_input
    case $edit_configjson_game_input in
    "1") edit_configjson_Server_game_bindAddress ;;
    "2") edit_configjson_Server_game_bindPort ;;
    "3") edit_configjson_Server_game_accessAddress ;;
    "4") edit_configjson_Server_game_accessPort ;;
    "5") edit_configjson_Server_game_loadEntitiesForPlayerRange ;;
    "6") edit_configjson_Server_game_enableScriptInBigWorld ;;
    "7") edit_configjson_Server_game_enableConsole ;;
    "8") edit_configjson_Server_game_kcpInterval ;;
    "9") edit_configjson_Server_game_logPackets ;;
    "10") edit_configjson_Server_game_isShowPacketPayload ;;
    "11") edit_configjson_Server_game_isShowLoopPackets ;;
    "12") edit_configjson_Server_game_gameOptions ;;
    "0") edit_configjson_Server_main ;;
    *)
        echo "${RC}Wrong Input!${WC}"
        sleep 0.4s
        edit_configjson_Server_game
        ;;
    esac
}
