getConfigJson() {
    getArguments=$1
    if [ $getArguments = "Server" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}logCommands${WC}";
        logCommands=$(jq '.server.logCommands' config.json)
        if [[ $logCommands = "true" ]]; then
            logCommandsOut="${GC}True${WC}"
        elif [[ $logCommands = "false" ]]; then
            logCommandsOut="${RC}False${WC}"
        else
            logCommandsOut=$logCommands
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}runMode${WC}";
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
        echo -en "\033[2K\r"
    elif [ $getArguments = "Server.HTTP" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}bindAddress${WC}";
        server_http_bindAddress=$(jq '.server.http.bindAddress' config.json | sed "s/\"//g")
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}accessAddress${WC}";
        server_http_accessAddress=$(jq '.server.http.accessAddress' config.json | sed "s/\"//g")
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}accessPort${WC}";
        server_http_accessPort=$(jq '.server.http.accessPort' config.json)
        echo -en "\033[2K\r"
    elif [ $getArguments = "Server.HTTP.Encryption" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}useEncryption${WC}";
        server_http_encryption_useEncryption=$(jq '.server.http.encryption.useEncryption' config.json)
        if [[ $server_http_encryption_useEncryption == "false" ]]; then
            server_http_encryption_useEncryptionOut="${RC}False${WC}"
        elif [[ $server_http_encryption_useEncryption == "true" ]]; then
            server_http_encryption_useEncryptionOut="${GC}True${WC}"
        else
            server_http_encryption_useEncryptionOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}useInRouting${WC}";
        server_http_encryption_useInRouting=$(jq '.server.http.encryption.useInRouting' config.json)
        if [[ $server_http_encryption_useInRouting == "false" ]]; then
            server_http_encryption_useInRoutingOut="${RC}False${WC}"
        elif [[ $server_http_encryption_useInRouting == "true" ]]; then
            server_http_encryption_useInRoutingOut="${GC}True${WC}"
        else
            server_http_encryption_useInRoutingOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}keystore${WC}";
        server_http_encryption_keystore=$(jq '.server.http.encryption.keystore' config.json | sed "s/\"//g")
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}keystorePassword${WC}";
        server_http_encryption_keystorePassword=$(jq '.server.http.encryption.keystorePassword' config.json | sed "s/\"//g")
        echo -en "\033[2K\r"
    elif [ $getArguments = "Server.http.policies.cors" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}enabled${WC}";
        server_http_policies_cors_enabled=$(jq '.server.http.policies.cors.enabled' config.json)
        if [[ $server_http_policies_cors_enabled == "false" ]]; then
            server_http_policies_cors_enabledOut="${RC}False${WC}"
        elif [[ $server_http_policies_cors_enabled == "true" ]]; then
            server_http_policies_cors_enabledOut="${GC}True${WC}"
        else
            server_http_policies_cors_enabledOut="${RC}Errro${WC}"
        fi
        echo -en "\033[2K\r"
    elif [ $getArguments = "Server.http.policies.cores" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}enbaled${WC}";
        server_http_policies_cores_enbaled=$(jq '.server.http.policies.cores.enbaled' config.json)
        if [[ $server_http_policies_cores_enbaled == "true" ]]; then
            server_http_policies_cores_enbaledOut="${GC}True${WC}"
        elif [[ $server_http_policies_cores_enbaled == "false" ]]; then
            server_http_policies_cores_enbaledOut="${RC}False${WC}"
        else
            server_http_policies_cores_enbaledOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}enabled${WC}";
        server_http_policies_cores_enabled=$(jq '.server.http.policies.cores.enabled' config.json)
        if [[ $server_http_policies_cores_enabled == "true" ]]; then
            server_http_policies_cores_enabledOut="${GC}True${WC}"
        elif [[ $server_http_policies_cores_enabled == "false" ]]; then
            server_http_policies_cores_enabledOut="${RC}False${WC}"
        else
            server_http_policies_cores_enabledOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r"
    elif [ $getArguments = "server.http.files" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}indexFile${WC}";
        server_http_files_indexFile=$(jq '.server.http.files.indexFile' config.json | sed "s/\"//g")
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}errorFile${WC}";
        server_http_files_errorFIle=$(jq '.server.http.files.errorFile' config.json | sed "s/\"//g")
        echo -en "\033[2K\r"
    elif [ $getArguments = "server.http.game" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}bindAddress${WC}";
        server_game_bindAddress=$(jq '.server.game.bindAddress' config.json | sed "s/\"//g")
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}bindPort${WC}";
        server_game_bindPort=$(jq '.server.game.bindPort' config.json)
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}accessAddress${WC}";
        server_game_accessAddress=$(jq '.server.game.accessAddress' config.json | sed "s/\"//g")
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}accessPort${WC}";
        server_game_accessPort=$(jq '.server.game.accessPort' config.json | sed "s/\"//g")
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}.loadEntitiesForPlayerRange${WC}";
        server_game_loadEntitiesForPlayerRange=$(jq '.server.game.loadEntitiesForPlayerRange' config.json)
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}.enableScriptInBigWorld${WC}";
        server_game_enableScriptInBigWorld=$(jq '.server.game.enableScriptInBigWorld' config.json)
        if [[ $server_game_enableScriptInBigWorld = "true" ]]; then
            server_game_enableScriptInBigWorldOut="${GC}True${WC}"
        elif [[ $server_game_enableScriptInBigWorld = "false" ]]; then
            server_game_enableScriptInBigWorldOut="${RC}False${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}enableConsole${WC}";
        server_game_enableConsole=$(jq '.server.game.enableConsole' config.json)
        if [[ $server_game_enableConsole == "true" ]]; then
            server_game_enableConsoleOut="${GC}True${WC}"
        elif [[ $server_game_enableConsole == "false" ]]; then
            server_game_enableConsoleOut="${RC}False${WC}"
        else
            server_game_enableConsoleOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}kcpInterval${WC}";
        server_game_kcpInterval=$(jq '.server.game.kcpInterval' config.json)
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}logPackets${WC}";
        server_game_logPackets=$(jq '.server.game.logPackets' config.json | sed "s/\"//g")
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}isShowPacketPayload${WC}";
        server_game_isShowPacketPayload=$(jq '.server.game.isShowPacketPayload' config.json)
        if [[ $server_game_isShowPacketPayload == "false" ]]; then
            server_game_isShowPacketPayloadOut="${RC}False${WC}"
        elif [[ $server_game_isShowPacketPayload == "true" ]]; then
            server_game_isShowPacketPayloadOut="${GC}True${WC}"
        else
            server_game_isShowPacketPayloadOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}isShowLoopPackets${WC}";
        server_game_isShowLoopPackets=$(jq '.server.game.isShowLoopPackets' config.json)
        if [[ $server_game_isShowLoopPackets == "true" ]]; then
            server_game_isShowLoopPacketsOut="${GC}True${WC}"
        elif [[ $server_game_isShowLoopPackets == "false" ]]; then
            server_game_isShowLoopPacketsOut="${RC}False${WC}"
        else
            server_game_isShowLoopPacketsOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r"
    elif [ $getArguments == "server.game.gameOptions" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}sceneEntityLimit${WC}";
        server_game_gameOptions_sceneEntityLimit=$(jq '.server.game.gameOptions.sceneEntityLimit' config.json)
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}watchGachaConfig${WC}";
        server_game_gameOptions_watchGachaConfig=$(jq '.server.game.gameOptions.watchGachaConfig' config.json)
        if [[ $server_game_gameOptions_watchGachaConfig == "true" ]]; then
            server_game_gameOptions_watchGachaConfigOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_watchGachaConfig == "false" ]]; then
            server_game_gameOptions_watchGachaConfigOut="${RC}False${WC}"
        else
            server_game_gameOptions_watchGachaConfigOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}enableShopItems${WC}";
        server_game_gameOptions_enableShopItems=$(jq '.server.game.gameOptions.enableShopItems' config.json)
        if [[ $server_game_gameOptions_enableShopItems == "true" ]]; then
            server_game_gameOptions_enableShopItemsOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_enableShopItems == "false" ]]; then
            server_game_gameOptions_enableShopItemsOut="${RC}False${WC}"
        else
            server_game_gameOptions_enableShopItemsOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}staminaUsage${WC}";
        server_game_gameOptions_staminaUsage=$(jq '.server.game.gameOptions.staminaUsage' config.json)
        if [[ $server_game_gameOptions_staminaUsage == "true" ]]; then
            server_game_gameOptions_staminaUsageOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_staminaUsage == "false" ]]; then
            server_game_gameOptions_staminaUsageOut="${RC}False${WC}"
        else
            server_game_gameOptions_staminaUsageOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}energyUsage${WC}";
        server_game_gameOptions_energyUsage=$(jq '.server.game.gameOptions.energyUsage' config.json)
        if [[ $server_game_gameOptions_energyUsage == "true" ]]; then
            server_game_gameOptions_energyUsageOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_energyUsage == "false" ]]; then
            server_game_gameOptions_energyUsageOut="${RC}False${WC}"
        else
            server_game_gameOptions_energyUsageOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}fishhookTeleport${WC}";
        server_game_gameOptions_fishhookTeleport=$(jq '.server.game.gameOptions.fishhookTeleport' config.json)
        if [[ $server_game_gameOptions_fishhookTeleport == "true" ]]; then
            server_game_gameOptions_fishhookTeleportOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_fishhookTeleport == "false" ]]; then
            server_game_gameOptions_fishhookTeleportOut="${RC}False${WC}"
        else
            server_game_gameOptions_fishhookTeleportOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r"
    elif [ $getArguments == "server.game.gameOptions.inventoryLimits" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}weapons${WC}";
        server_game_gameOptions_inventoryLimits_weapons=$(jq '.server.game.gameOptions.inventoryLimits.weapons' config.json)
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}relics${WC}";
        server_game_gameOptions_inventoryLimits_relics=$(jq '.server.game.gameOptions.inventoryLimits.relics' config.json)
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}materials${WC}";
        server_game_gameOptions_inventoryLimits_materials=$(jq '.server.game.gameOptions.inventoryLimits.materials' config.json)
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}furniture${WC}";
        server_game_gameOptions_inventoryLimits_furniture=$(jq '.server.game.gameOptions.inventoryLimits.furniture' config.json)
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}all${WC}";
        server_game_gameOptions_inventoryLimits_all=$(jq '.server.game.gameOptions.inventoryLimits.all' config.json)
        echo -en "\033[2K\r"
    elif [ $getArguments == "server.game.gameOptions.avatarLimits" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}singlePlayerTeam${WC}";
        server_game_gameOptions_avatarLimits_singlePlayerTeam=$(jq '.server.game.gameOptions.avatarLimits.singlePlayerTeam' config.json)
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}multiplayerTeam${WC}";
        server_game_gameOptions_avatarLimits_multiplayerTeam=$(jq '.server.game.gameOptions.avatarLimits.multiplayerTeam' config.json)
        echo -en "\033[2K\r"
    elif [ $getArguments == "server.game.gameOptions.resinOptions" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}resinUsage${WC}";
        server_game_gameOptions_resinOptions_resinUsage=$(jq '.server.game.gameOptions.resinOptions.resinUsage' config.json)
        if [[ $server_game_gameOptions_resinOptions_resinUsage == "true" ]]; then
            server_game_gameOptions_resinOptions_resinUsageOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_resinOptions_resinUsage == "false" ]]; then
            server_game_gameOptions_resinOptions_resinUsageOut="${RC}False${WC}"
        else
            server_game_gameOptions_resinOptions_resinUsageOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}cap${WC}";
        server_game_gameOptions_resinOptions_cap=$(jq '.server.game.gameOptions.resinOptions.cap' config.json)
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}rechargeTime${WC}";
        server_game_gameOptions_resinOptions_rechargeTime=$(jq '.server.game.gameOptions.resinOptions.rechargeTime' config.json)
        echo -en "\033[2K\r"
    elif [ $getArguments == "server.game.gameOptions.rates" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}adventureExp${WC}";
        server_game_gameOptions_rates_adventureExp=$(jq '.server.game.gameOptions.rates.adventureExp' config.json)
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}mora${WC}";
        server_game_gameOptions_rates_mora=$(jq '.server.game.gameOptions.rates.mora' config.json)
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}leyLines${WC}";
        server_game_gameOptions_rates_leyLines=$(jq '.server.game.gameOptions.rates.leyLines' config.json)
        echo -en "\033[2K\r"
    else
        echo "${RC}Cant Load, Unknown Error!${WC}"
    fi
}
