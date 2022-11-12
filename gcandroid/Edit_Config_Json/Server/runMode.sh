edit_configjson_Server_runMode() {
    editConfigJson_Back="edit_configjson_Server_main"
    if [ $runMode = "\"HYBRID\"" ]; then
        editJsonJq "server.runMode=\"DISPATCH_ONLY\""
    elif [ $runMode = "\"DISPATCH_ONLY\"" ]; then
        editJsonJq "server.runMode=\"GAME_ONLY\""
    elif [ $runMode = "\"GAME_ONLY\"" ]; then
        editJsonJq "server.runMode=\"HYBRID\""
    fi
}
