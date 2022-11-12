getConfigJson() {
    getArguments=$1
    if [ $getArguments = "Server" ]; then
        logCommands=$(cat config.json | jq '.server.logCommands')
        if [[ $logCommands = "true" ]]; then
            logCommandsOut="${GC}True${WC}"
        elif [[ $logCommands = "false" ]]; then
            logCommandsOut="${RC}False${WC}"
        else
            logCommandsOut=$logCommands
        fi
        runMode=$(cat config.json | jq '.server.runMode')
        if [[ $runMode = "\"HYBRID\"" ]]; then
            runModeOut="${GC}HYBRID${WC}"
        elif [[ $runMode = "\"DISPATCH_ONLY\"" ]]; then
            runModeOut="${GC}DISPATCH_ONLY${WC}"
        elif [[ $runMode = "\"GAME_ONLY\"" ]]; then
            runModeOut="${GC}GAME_ONLY${WC}"
        else
            runModeOut="${RC}Error${WC}"
        fi
    elif [ $getArguments = "Server.HTTP" ]; then
        server_http_bindAddress=$(cat config.json | jq '.server.http.bindAddress' | sed "s/\"//g")
        server_http_accessAddress=$(cat config.json | jq '.server.http.accessAddress' | sed "s/\"//g")
        server_http_accessPort=$(cat config.json | jq '.server.http.accessPort')
    elif [ $getArguments = "Server.HTTP.Encryption" ]; then
        server_http_encryption_useEncryption=$(cat config.json | jq '.server.http.encryption.useEncryption')
        if [[ $server_http_encryption_useEncryption == "false" ]]; then
            server_http_encryption_useEncryptionOut="${RC}False${WC}"
        elif [[ $server_http_encryption_useEncryption == "true" ]]; then
            server_http_encryption_useEncryptionOut="${GC}True${WC}"
        else
            server_http_encryption_useEncryptionOut="${RC}Error${WC}"
        fi
        server_http_encryption_useInRouting=$(cat config.json | jq '.server.http.encryption.useInRouting')
        if [[ $server_http_encryption_useInRouting == "false" ]]; then
            server_http_encryption_useInRoutingOut="${RC}False${WC}"
        elif [[ $server_http_encryption_useInRouting == "true" ]]; then
            server_http_encryption_useInRoutingOut="${GC}True${WC}"
        else
            server_http_encryption_useInRoutingOut="${RC}Error${WC}"
        fi
    else
        echo "${RC}Cant Load, Unknown Error!${WC}"
    fi
}
