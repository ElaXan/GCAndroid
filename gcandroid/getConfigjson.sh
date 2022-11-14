getConfigJson() {
    getArguments=$1
    if [ $getArguments = "Server" ]; then
        logCommands=$(jq '.server.logCommands' config.json)
        if [[ $logCommands = "true" ]]; then
            logCommandsOut="${GC}True${WC}"
        elif [[ $logCommands = "false" ]]; then
            logCommandsOut="${RC}False${WC}"
        else
            logCommandsOut=$logCommands
        fi
        runMode=$(jq '.server.runMode' config.json)
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
        server_http_bindAddress=$(jq '.server.http.bindAddress' config.json | sed "s/\"//g")
        server_http_accessAddress=$(jq '.server.http.accessAddress' config.json | sed "s/\"//g")
        server_http_accessPort=$(jq '.server.http.accessPort' config.json)
    elif [ $getArguments = "Server.HTTP.Encryption" ]; then
        server_http_encryption_useEncryption=$(jq '.server.http.encryption.useEncryption' config.json)
        if [[ $server_http_encryption_useEncryption == "false" ]]; then
            server_http_encryption_useEncryptionOut="${RC}False${WC}"
        elif [[ $server_http_encryption_useEncryption == "true" ]]; then
            server_http_encryption_useEncryptionOut="${GC}True${WC}"
        else
            server_http_encryption_useEncryptionOut="${RC}Error${WC}"
        fi
        server_http_encryption_useInRouting=$(jq '.server.http.encryption.useInRouting' config.json)
        if [[ $server_http_encryption_useInRouting == "false" ]]; then
            server_http_encryption_useInRoutingOut="${RC}False${WC}"
        elif [[ $server_http_encryption_useInRouting == "true" ]]; then
            server_http_encryption_useInRoutingOut="${GC}True${WC}"
        else
            server_http_encryption_useInRoutingOut="${RC}Error${WC}"
        fi
        server_http_encryption_keystore=$(jq '.server.http.encryption.keystore' config.json | sed "s/\"//g")
        server_http_encryption_keystorePassword=$(jq '.server.http.encryption.keystorePassword' config.json | sed "s/\"//g")
    elif [ $getArguments = "Server.http.policies.cors" ]; then
        server_http_policies_cors_enabled=$(jq '.server.http.policies.cors.enabled' config.json)
        if [[ $server_http_policies_cors_enabled == "false" ]]; then
            server_http_policies_cors_enabledOut="${RC}False${WC}"
        elif [[ $server_http_policies_cors_enabled == "true" ]]; then
            server_http_policies_cors_enabledOut="${GC}True${WC}"
        else
            server_http_policies_cors_enabledOut="${RC}Errro${WC}"
        fi
    elif [ $getArguments = "Server.http.policies.cores" ]; then
        server_http_policies_cores_enbaled=$(jq '.server.http.policies.cores.enbaled' config.json)
        if [[ $server_http_policies_cores_enbaled == "true" ]]; then
            server_http_policies_cores_enbaledOut="${GC}True${WC}"
        elif [[ $server_http_policies_cores_enbaled == "false" ]]; then
            server_http_policies_cores_enbaledOut="${RC}False${WC}"
        else
            server_http_policies_cores_enbaledOut="${RC}Error${WC}"
        fi
        server_http_policies_cores_enabled=$(jq '.server.http.policies.cores.enabled' config.json)
        if [[ $server_http_policies_cores_enabled == "true" ]]; then
            server_http_policies_cores_enabledOut="${GC}True${WC}"
        elif [[ $server_http_policies_cores_enabled == "false" ]]; then
            server_http_policies_cores_enabledOut="${RC}False${WC}"
        else
            server_http_policies_cores_enabledOut="${RC}Error${WC}"
        fi
    elif [ $getArguments = "server.http.files" ]; then
        server_http_files_indexFile=$(jq '.server.http.files.indexFile' config.json | sed "s/\"//g")
        server_http_files_errorFIle=$(jq '.server.http.files.errorFile' config.json | sed "s/\"//g")
    elif [ $getArguments = "server.http.game" ]; then
        server_game_bindAddress=$(jq '.server.game.bindAddress' config.json | sed "s/\"//g")
        server_game_bindPort=$(jq '.server.game.bindPort' config.json)
        server_game_accessAddress=$(jq '.server.game.accessAddress' config.json | sed "s/\"//g")
        server_game_accessPort=$(jq '.server.game.accessPort' config.json | sed "s/\"//g")
        server_game_loadEntitiesForPlayerRange=$(jq '.server.game.loadEntitiesForPlayerRange' config.json)
        server_game_enableScriptInBigWorld=$(jq '.server.game.enableScriptInBigWorld' config.json)
        if [[ $server_game_enableScriptInBigWorld = "true" ]]; then
            server_game_enableScriptInBigWorldOut="${GC}True${WC}"
        elif [[ $server_game_enableScriptInBigWorld = "false" ]]; then
            server_game_enableScriptInBigWorldOut="${RC}False${WC}"
        fi
        server_game_enableConsole=$(jq '.server.game.enableConsole' config.json)
        if [[ $server_game_enableConsole == "true" ]]; then
            server_game_enableConsoleOut="${GC}True${WC}"
        elif [[ $server_game_enableConsole == "false" ]]; then
            server_game_enableConsoleOut="${RC}False${WC}"
        else
            server_game_enableConsoleOut="${RC}Error${WC}"
        fi
        server_game_kcpInterval=$(jq '.server.game.kcpInterval' config.json)
        server_game_logPackets=$(jq '.server.game.logPackets' config.json | sed "s/\"//g")
        server_game_isShowPacketPayload=$(jq '.server.game.isShowPacketPayload' config.json)
        if [[ $server_game_isShowPacketPayload == "false" ]]; then
            server_game_isShowPacketPayloadOut="${RC}False${WC}"
        elif [[ $server_game_isShowPacketPayload == "true" ]]; then
            server_game_isShowPacketPayloadOut="${GC}True${WC}"
        else
            server_game_isShowPacketPayloadOut="${RC}Error${WC}"
        fi
        server_game_isShowLoopPackets=$(jq '.server.game.isShowLoopPackets' config.json)
        if [[ $server_game_isShowLoopPackets == "true" ]]; then
            server_game_isShowLoopPacketsOut="${GC}True${WC}"
        elif [[ $server_game_isShowLoopPackets == "false" ]]; then
            server_game_isShowLoopPacketsOut="${RC}False${WC}"
        else
            server_game_isShowLoopPacketsOut="${RC}Error${WC}"
        fi
    elif [ $getArguments == "server.game.gameOptions" ]; then
        server_game_gameOptions_sceneEntityLimit=$(jq '.server.game.gameOptions.sceneEntityLimit' config.json)
        server_game_gameOptions_watchGachaConfig=$(jq '.server.game.gameOptions.watchGachaConfig' config.json)
        if [[ $server_game_gameOptions_watchGachaConfig == "true" ]]; then
            server_game_gameOptions_watchGachaConfigOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_watchGachaConfig == "false" ]]; then
            server_game_gameOptions_watchGachaConfigOut="${RC}False${WC}"
        else
            server_game_gameOptions_watchGachaConfigOut="${RC}Error${WC}"
        fi
        server_game_gameOptions_enableShopItems=$(jq '.server.game.gameOptions.enableShopItems' config.json)
        if [[ $server_game_gameOptions_enableShopItems == "true" ]]; then
            server_game_gameOptions_enableShopItemsOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_enableShopItems == "false" ]]; then
            server_game_gameOptions_enableShopItemsOut="${RC}False${WC}"
        else
            server_game_gameOptions_enableShopItemsOut="${RC}Error${WC}"
        fi
        server_game_gameOptions_staminaUsage=$(jq '.server.game.gameOptions.staminaUsage' config.json)
        if [[ $server_game_gameOptions_staminaUsage == "true" ]]; then
            server_game_gameOptions_staminaUsageOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_staminaUsage == "false" ]]; then
            server_game_gameOptions_staminaUsageOut="${RC}False${WC}"
        else
            server_game_gameOptions_staminaUsageOut="${RC}Error${WC}"
        fi
    else
        echo "${RC}Cant Load, Unknown Error!${WC}"
    fi
}
