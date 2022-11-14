edit_configjson_Server_game_accessAddress() {
    editConfigJson_Back="edit_configjson_Server_game"
    echo
    echo -n "${CCB}Enter custom accessAddress : ${YC}"
    read -r edit_configjson_Server_game_accessAddress_input
    if [[ $edit_configjson_Server_game_accessAddress_input = "" ]]; then
        edit_configjson_Server_game
    elif ! (echo "$edit_configjson_Server_game_accessAddress_input" | grep ".*\..*\..*\..*" &> /dev/null); then
        echo "${RC}Error${WC}"
        sleep 0.3s
        edit_configjson_Server_game
    else
        editJsonJq "server.game.accessAddress=\"$edit_configjson_Server_game_accessAddress_input\""
    fi
}