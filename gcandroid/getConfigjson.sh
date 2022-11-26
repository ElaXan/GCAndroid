getConfigJson() {
    getArguments=$1
    if [ $getArguments = "folderStructure" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}resources${WC}";
        folderStructure_resources=$(jq '.folderStructure.resources' config.json | sed "s/\"//g")
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}data${WC}";
        folderStructure_data=$(jq '.folderStructure.data' config.json | sed "s/\"//g")
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}packets${WC}";
        folderStructure_packets=$(jq '.folderStructure.packets' config.json | sed "s/\"//g")
        echo -en "\033[2K\r"
    elif [ $getArguments = "Server" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}logCommands${WC}";
        logCommands=$(jq '.server.logCommands' config.json 2>/dev/null)
        if [[ $logCommands = "true" ]]; then
            logCommandsOut="${GC}True${WC}"
        elif [[ $logCommands = "false" ]]; then
            logCommandsOut="${RC}False${WC}"
        else
            logCommandsOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}runMode${WC}";
        runMode=$(jq '.server.runMode' config.json 2>/dev/null)
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
        server_http_bindAddress=$(jq '.server.http.bindAddress' config.json 2>/dev/null | sed "s/\"//g")
        if [[ $server_http_bindAddress == "" ]]; then
            server_http_bindAddress="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}accessAddress${WC}";
        server_http_accessAddress=$(jq '.server.http.accessAddress' config.json 2>/dev/null | sed "s/\"//g")
        if [[ $server_http_accessAddress == "" ]]; then
            server_http_accessAddress="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}accessPort${WC}";
        server_http_accessPort=$(jq '.server.http.accessPort' config.json 2>/dev/null)
        if [[ $server_http_accessPort == "" ]]; then
            server_http_accessPort="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r"
    elif [ $getArguments = "Server.HTTP.Encryption" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}useEncryption${WC}";
        server_http_encryption_useEncryption=$(jq '.server.http.encryption.useEncryption' config.json 2>/dev/null)
        if [[ $server_http_encryption_useEncryption == "false" ]]; then
            server_http_encryption_useEncryptionOut="${RC}False${WC}"
        elif [[ $server_http_encryption_useEncryption == "true" ]]; then
            server_http_encryption_useEncryptionOut="${GC}True${WC}"
        else
            server_http_encryption_useEncryptionOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}useInRouting${WC}";
        server_http_encryption_useInRouting=$(jq '.server.http.encryption.useInRouting' config.json 2>/dev/null)
        if [[ $server_http_encryption_useInRouting == "false" ]]; then
            server_http_encryption_useInRoutingOut="${RC}False${WC}"
        elif [[ $server_http_encryption_useInRouting == "true" ]]; then
            server_http_encryption_useInRoutingOut="${GC}True${WC}"
        else
            server_http_encryption_useInRoutingOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}keystore${WC}";
        server_http_encryption_keystore=$(jq '.server.http.encryption.keystore' config.json 2>/dev/null | sed "s/\"//g")
        if [[ $server_http_encryption_keystore == "" ]]; then
            server_http_encryption_keystore="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}keystorePassword${WC}";
        server_http_encryption_keystorePassword=$(jq '.server.http.encryption.keystorePassword' config.json 2>/dev/null | sed "s/\"//g")
        if [[ $server_http_encryption_keystorePassword == "" ]]; then
            server_http_encryption_keystorePassword="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r"
    elif [ $getArguments = "Server.http.policies.cors" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}enabled${WC}";
        server_http_policies_cors_enabled=$(jq '.server.http.policies.cors.enabled' config.json 2>/dev/null)
        if [[ $server_http_policies_cors_enabled == "false" ]]; then
            server_http_policies_cors_enabledOut="${RC}False${WC}"
        elif [[ $server_http_policies_cors_enabled == "true" ]]; then
            server_http_policies_cors_enabledOut="${GC}True${WC}"
        else
            server_http_policies_cors_enabledOut="${RC}Errro${WC}"
        fi
        echo -en "\033[2K\r"
    elif [ $getArguments = "server.http.files" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}indexFile${WC}";
        server_http_files_indexFile=$(jq '.server.http.files.indexFile' config.json 2>/dev/null | sed "s/\"//g")
        if [[ $server_http_files_indexFile == "" ]]; then
            server_http_files_indexFile="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}errorFile${WC}";
        server_http_files_errorFIle=$(jq '.server.http.files.errorFile' config.json 2>/dev/null | sed "s/\"//g")
        if [[ $server_http_files_errorFIle == "" ]]; then
            server_http_files_errorFIle="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r"
    elif [ $getArguments = "server.http.game" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}bindAddress${WC}";
        server_game_bindAddress=$(jq '.server.game.bindAddress' config.json 2>/dev/null | sed "s/\"//g")
        if [[ $server_game_bindAddress == "" ]]; then
            server_game_bindAddress="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}bindPort${WC}";
        server_game_bindPort=$(jq '.server.game.bindPort' config.json 2>/dev/null)
        if [[ $server_game_bindPort == "" ]]; then
            server_game_bindPort="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}accessAddress${WC}";
        server_game_accessAddress=$(jq '.server.game.accessAddress' config.json 2>/dev/null | sed "s/\"//g")
        if [[ $server_game_accessAddress == "" ]]; then
            server_game_accessAddress="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}accessPort${WC}";
        server_game_accessPort=$(jq '.server.game.accessPort' config.json 2>/dev/null | sed "s/\"//g")
        if [[ $server_game_accessPort == "" ]]; then
            server_game_accessPort="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}loadEntitiesForPlayerRange${WC}";
        server_game_loadEntitiesForPlayerRange=$(jq '.server.game.loadEntitiesForPlayerRange' config.json 2>/dev/null)
        if [[ $server_game_loadEntitiesForPlayerRange == "" ]]; then
            server_game_loadEntitiesForPlayerRange="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}enableScriptInBigWorld${WC}";
        server_game_enableScriptInBigWorld=$(jq '.server.game.enableScriptInBigWorld' config.json 2>/dev/null)
        if [[ $server_game_enableScriptInBigWorld = "true" ]]; then
            server_game_enableScriptInBigWorldOut="${GC}True${WC}"
        elif [[ $server_game_enableScriptInBigWorld = "false" ]]; then
            server_game_enableScriptInBigWorldOut="${RC}False${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}enableConsole${WC}";
        server_game_enableConsole=$(jq '.server.game.enableConsole' config.json 2>/dev/null)
        if [[ $server_game_enableConsole == "true" ]]; then
            server_game_enableConsoleOut="${GC}True${WC}"
        elif [[ $server_game_enableConsole == "false" ]]; then
            server_game_enableConsoleOut="${RC}False${WC}"
        else
            server_game_enableConsoleOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}kcpInterval${WC}";
        server_game_kcpInterval=$(jq '.server.game.kcpInterval' config.json 2>/dev/null)
        if [[ $server_game_kcpInterval == "" ]]; then
            server_game_kcpInterval="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}logPackets${WC}";
        server_game_logPackets=$(jq '.server.game.logPackets' config.json 2>/dev/null | sed "s/\"//g")
        if [[ $server_game_logPackets == "" ]]; then
            server_game_logPackets="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}isShowPacketPayload${WC}";
        server_game_isShowPacketPayload=$(jq '.server.game.isShowPacketPayload' config.json 2>/dev/null)
        if [[ $server_game_isShowPacketPayload == "false" ]]; then
            server_game_isShowPacketPayloadOut="${RC}False${WC}"
        elif [[ $server_game_isShowPacketPayload == "true" ]]; then
            server_game_isShowPacketPayloadOut="${GC}True${WC}"
        else
            server_game_isShowPacketPayloadOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}isShowLoopPackets${WC}";
        server_game_isShowLoopPackets=$(jq '.server.game.isShowLoopPackets' config.json 2>/dev/null)
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
        server_game_gameOptions_sceneEntityLimit=$(jq '.server.game.gameOptions.sceneEntityLimit' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_sceneEntityLimit == "" ]]; then
            server_game_gameOptions_sceneEntityLimit="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}watchGachaConfig${WC}";
        server_game_gameOptions_watchGachaConfig=$(jq '.server.game.gameOptions.watchGachaConfig' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_watchGachaConfig == "true" ]]; then
            server_game_gameOptions_watchGachaConfigOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_watchGachaConfig == "false" ]]; then
            server_game_gameOptions_watchGachaConfigOut="${RC}False${WC}"
        else
            server_game_gameOptions_watchGachaConfigOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}enableShopItems${WC}";
        server_game_gameOptions_enableShopItems=$(jq '.server.game.gameOptions.enableShopItems' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_enableShopItems == "true" ]]; then
            server_game_gameOptions_enableShopItemsOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_enableShopItems == "false" ]]; then
            server_game_gameOptions_enableShopItemsOut="${RC}False${WC}"
        else
            server_game_gameOptions_enableShopItemsOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}staminaUsage${WC}";
        server_game_gameOptions_staminaUsage=$(jq '.server.game.gameOptions.staminaUsage' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_staminaUsage == "true" ]]; then
            server_game_gameOptions_staminaUsageOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_staminaUsage == "false" ]]; then
            server_game_gameOptions_staminaUsageOut="${RC}False${WC}"
        else
            server_game_gameOptions_staminaUsageOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}energyUsage${WC}";
        server_game_gameOptions_energyUsage=$(jq '.server.game.gameOptions.energyUsage' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_energyUsage == "true" ]]; then
            server_game_gameOptions_energyUsageOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_energyUsage == "false" ]]; then
            server_game_gameOptions_energyUsageOut="${RC}False${WC}"
        else
            server_game_gameOptions_energyUsageOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}fishhookTeleport${WC}";
        server_game_gameOptions_fishhookTeleport=$(jq '.server.game.gameOptions.fishhookTeleport' config.json 2>/dev/null)
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
        server_game_gameOptions_inventoryLimits_weapons=$(jq '.server.game.gameOptions.inventoryLimits.weapons' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_inventoryLimits_weapons == "" ]]; then
            server_game_gameOptions_inventoryLimits_weapons="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}relics${WC}";
        server_game_gameOptions_inventoryLimits_relics=$(jq '.server.game.gameOptions.inventoryLimits.relics' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_inventoryLimits_relics == "" ]]; then
            server_game_gameOptions_inventoryLimits_relics="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}materials${WC}";
        server_game_gameOptions_inventoryLimits_materials=$(jq '.server.game.gameOptions.inventoryLimits.materials' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_inventoryLimits_materials == "" ]]; then
            server_game_gameOptions_inventoryLimits_materials="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}furniture${WC}";
        server_game_gameOptions_inventoryLimits_furniture=$(jq '.server.game.gameOptions.inventoryLimits.furniture' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_inventoryLimits_furniture == "" ]]; then
            server_game_gameOptions_inventoryLimits_furniture="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}all${WC}";
        server_game_gameOptions_inventoryLimits_all=$(jq '.server.game.gameOptions.inventoryLimits.all' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_inventoryLimits_all == "" ]]; then
            server_game_gameOptions_inventoryLimits_all="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r"
    elif [ $getArguments == "server.game.gameOptions.avatarLimits" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}singlePlayerTeam${WC}";
        server_game_gameOptions_avatarLimits_singlePlayerTeam=$(jq '.server.game.gameOptions.avatarLimits.singlePlayerTeam' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_avatarLimits_singlePlayerTeam == "" ]]; then
            server_game_gameOptions_avatarLimits_singlePlayerTeam="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}multiplayerTeam${WC}";
        server_game_gameOptions_avatarLimits_multiplayerTeam=$(jq '.server.game.gameOptions.avatarLimits.multiplayerTeam' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_avatarLimits_multiplayerTeam == "" ]]; then
            server_game_gameOptions_avatarLimits_multiplayerTeam="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r"
    elif [ $getArguments == "server.game.gameOptions.resinOptions" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}resinUsage${WC}";
        server_game_gameOptions_resinOptions_resinUsage=$(jq '.server.game.gameOptions.resinOptions.resinUsage' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_resinOptions_resinUsage == "true" ]]; then
            server_game_gameOptions_resinOptions_resinUsageOut="${GC}True${WC}"
        elif [[ $server_game_gameOptions_resinOptions_resinUsage == "false" ]]; then
            server_game_gameOptions_resinOptions_resinUsageOut="${RC}False${WC}"
        else
            server_game_gameOptions_resinOptions_resinUsageOut="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}cap${WC}";
        server_game_gameOptions_resinOptions_cap=$(jq '.server.game.gameOptions.resinOptions.cap' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_resinOptions_cap == "" ]]; then
            echo "${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}rechargeTime${WC}";
        server_game_gameOptions_resinOptions_rechargeTime=$(jq '.server.game.gameOptions.resinOptions.rechargeTime' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_resinOptions_rechargeTime == "" ]]; then
            server_game_gameOptions_resinOptions_rechargeTime="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r"
    elif [ $getArguments == "server.game.gameOptions.rates" ]; then
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}adventureExp${WC}";
        server_game_gameOptions_rates_adventureExp=$(jq '.server.game.gameOptions.rates.adventureExp' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_rates_adventureExp == "" ]]; then
            server_game_gameOptions_rates_adventureExp="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}mora${WC}";
        server_game_gameOptions_rates_mora=$(jq '.server.game.gameOptions.rates.mora' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_rates_mora == "" ]]; then
            server_game_gameOptions_rates_mora="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r${GC}Getting Value${WC} : ${CCB}leyLines${WC}";
        server_game_gameOptions_rates_leyLines=$(jq '.server.game.gameOptions.rates.leyLines' config.json 2>/dev/null)
        if [[ $server_game_gameOptions_rates_leyLines == "" ]]; then
            server_game_gameOptions_rates_leyLines="${RC}Error${WC}"
        fi
        echo -en "\033[2K\r"
    else
        echo "${RC}Cant Load, Unknown Error!${WC}"
    fi
}
