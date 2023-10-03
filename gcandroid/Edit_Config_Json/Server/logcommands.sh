edit_configjson_Server_logcommands() {
    editConfigJson_Back="edit_configjson_Server_main"
    if [ $logCommands = "true" ]; then
        editJsonJq "server.logCommands=false"
    elif [ $logCommands = "false" ]; then
        editJsonJq "server.logCommands=true"
    fi
}
