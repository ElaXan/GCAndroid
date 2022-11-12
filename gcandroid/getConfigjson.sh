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
        server_http_encryption_keystore=$(cat config.json | jq '.server.http.encryption.keystore' | sed "s/\"//g")
        server_http_encryption_keystorePassword=$(cat config.json | jq '.server.http.encryption.keystorePassword' | sed "s/\"//g")
    elif [ $getArguments = "Server.http.policies.cors" ]; then
        server_http_policies_cors_enabled=$(cat config.json | jq '.server.http.policies.cors.enabled')
        if [[ $server_http_policies_cors_enabled == "false" ]]; then
            server_http_policies_cors_enabledOut="${RC}False${WC}"
        elif [[ $server_http_policies_cors_enabled == "true" ]]; then
            server_http_policies_cors_enabledOut="${GC}True${WC}"
        else
            server_http_policies_cors_enabledOut="${RC}Errro${WC}"
        fi
    elif [ $getArguments = "Server.http.policies.cores" ]; then
        server_http_policies_cores_enbaled=$(cat config.json | jq '.server.http.policies.cores.enbaled')
        if [[ $server_http_policies_cores_enbaled == "true" ]]; then
            server_http_policies_cores_enbaledOut="${GC}True${WC}"
        elif [[ $server_http_policies_cores_enbaled == "false" ]]; then
            server_http_policies_cores_enbaledOut="${RC}False${WC}"
        else
            server_http_policies_cores_enbaledOut="${RC}Error${WC}"
        fi
        server_http_policies_cores_enabled=$(cat config.json | jq '.server.http.policies.cores.enabled')
        if [[ $server_http_policies_cores_enabled == "true" ]]; then
            server_http_policies_cores_enabledOut="${GC}True${WC}"
        elif [[ $server_http_policies_cores_enabled == "false" ]]; then
            server_http_policies_cores_enabledOut="${RC}False${WC}"
        else
            server_http_policies_cores_enabledOut="${RC}Error${WC}"
        fi
    elif [ $getArguments = "server.http.files" ]; then
        server_http_files_indexFile=$(cat config.json | jq '.server.http.files.indexFile' | sed "s/\"//g")
    else
        echo "${RC}Cant Load, Unknown Error!${WC}"
    fi
}
