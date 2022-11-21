loadOtherShellScript() {
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}changePort.sh${WC}";
    if [ -f "$GCAndroid/changePort.sh" ]; then
        source $GCAndroid/changePort.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/changePort.sh not found"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}installGrasscutter.sh${WC}";
    if [ -f "$GCAndroid/installGrasscutter.sh" ]; then
        source $GCAndroid/installGrasscutter.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/installGrasscutter.sh not found"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}menuFalseTrue.sh${WC}";
    if [ -f "$GCAndroid/menuFalseTrue.sh" ]; then
        source $GCAndroid/menuFalseTrue.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/menuFalseTrue.sh not found"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}runGrasscutter.sh${WC}";
    if [ -f "$GCAndroid/runGrasscutter.sh" ]; then
        source $GCAndroid/runGrasscutter.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/runGrasscutter.sh not found"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}spin.sh${WC}";
    if [ -f "$GCAndroid/spin.sh" ]; then
        source $GCAndroid/spin.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/spin.sh not found"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}installPlugin.sh${WC}";
    if [ -f "$GCAndroid/installPlugin.sh" ]; then
        source $GCAndroid/installPlugin.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/installPlugin.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}removePlugin.sh${WC}";
    if [ -f "$GCAndroid/removePlugin.sh" ]; then
        source $GCAndroid/removePlugin.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/removePlugin.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}compileGrasscutter.sh${WC}";
    if [ -f "$GCAndroid/compileGrasscutter.sh" ]; then
        source $GCAndroid/compileGrasscutter.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/compileGrasscutter.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}generateHandbook.sh${WC}";
    if [ -f "$GCAndroid/generateHandbook.sh" ]; then
        source $GCAndroid/generateHandbook.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/generateHandbook.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}editConfigJson.sh${WC}";
    if [ -f "$GCAndroid/editConfigJson.sh" ]; then
        source $GCAndroid/editConfigJson.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/editConfigJson.sh not found"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}getConfigjson.sh${WC}";
    if [ -f "$GCAndroid/getConfigjson.sh" ]; then
        source $GCAndroid/getConfigjson.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/getConfigjson.sh not found"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}EditBanners.sh${WC}";
    if [ -f "$GCAndroid/EditBanners.sh" ]; then
        source $GCAndroid/EditBanners.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/EditBanners.sh not found"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}Server.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/Server.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/Server.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/Server.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}logcommands.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/logcommands.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/logcommands.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/logcommands.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}runMode.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/runMode.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/runMode.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/runMode.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}Http.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/Http.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/Http.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/Http.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}bindAddress.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/bindAddress.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/bindAddress.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/bindAddress.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}accessAddress.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/accessAddress.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/accessAddress.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/accessAddress.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}accessPort.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/accessPort.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/accessPort.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/accessPort.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}encryption.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/encryption/encryption.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/encryption/encryption.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/encryption/encryption.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}useEncryption.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/encryption/useEncryption.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/encryption/useEncryption.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/encryption/useEncryption.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}useInRouting.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/encryption/useInRouting.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/encryption/useInRouting.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/encryption/useInRouting.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}keystore.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/encryption/keystore.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/encryption/keystore.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/encryption/keystore.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}keystorePassword.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/encryption/keystorePassword.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/encryption/keystorePassword.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/encryption/keystorePassword.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}policies.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/policies/policies.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/policies/policies.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/policies/policies.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}cors.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/policies/cors/cors.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/policies/cors/cors.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/policies/cors/cors.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}enabled.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/policies/cors/enabled.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/policies/cors/enabled.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/policies/cors/enabled.sh not found!"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}files.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/files/files.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/files/files.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/files/files.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}indexFile.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/files/indexFile.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/files/indexFile.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}Edit_Config_Json/Server/http/files/indexFile.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}errorFile.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/files/errorFile.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/files/errorFile.sh
    else
        echo "${GC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/files/errorFile.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}game.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/game.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/game.sh
    else
        echo "${GC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/game.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}bindAddress.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/bindAddress.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/bindAddress.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/bindAddress.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}bindPort.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/bindPort.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/bindPort.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/bindPort.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}accessAddress.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/accessAddress.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/accessAddress.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/accessAddress.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}accessPort.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/accessPort.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/accessPort.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/accessPort.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}loadEntitiesForPlayerRange.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/loadEntitiesForPlayerRange.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/loadEntitiesForPlayerRange.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/loadEntitiesForPlayerRange.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}enableScriptInBigWorld.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/enableScriptInBigWorld.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/enableScriptInBigWorld.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/enableScriptInBigWorld.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}enableConsole.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/enableConsole.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/enableConsole.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/enableConsole.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}kcpInterval.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/kcpInterval.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/kcpInterval.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/kcpInterval.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}logPackets.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/logPackets.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/logPackets.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/logPackets.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}isShowPacketPayload.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/isShowPacketPayload.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/isShowPacketPayload.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/isShowPacketPayload.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}isShowLoopPackets.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/isShowLoopPackets.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/isShowLoopPackets.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/isShowLoopPackets.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}gameOptions.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/gameOptions.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/gameOptions.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/gameOptions.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}sceneEntityLimit.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/sceneEntityLimit.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/sceneEntityLimit.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/sceneEntityLimit.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}watchGachaConfig.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/watchGachaConfig.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/watchGachaConfig.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/watchGachaConfig.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}enableShopItems.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/enableShopItems.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/enableShopItems.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/enableShopItems.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}staminaUsage.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/staminaUsage.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/staminaUsage.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/staminaUsage.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}energyUsage.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/energyUsage.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/energyUsage.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/energyUsage.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}fishhookTeleport.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/fishhookTeleport.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/fishhookTeleport.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/fishhookTeleport.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}inventoryLimits.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/inventoryLimits.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/inventoryLimits.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/inventoryLimits.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}weapons.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/weapons.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/weapons.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/weapons.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}relics.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/relics.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/relics.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/relics.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}materials.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/materials.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/materials.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/materials.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}furniture.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/furniture.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/furniture.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/furniture.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}all.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/all.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/all.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/all.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}avatarLimits.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/avatarLimits.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/avatarLimits.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/avatarLimits.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}singlePlayerTeam.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/singlePlayerTeam.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/singlePlayerTeam.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/singlePlayerTeam.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}multiplayerTeam.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/multiplayerTeam.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/multiplayerTeam.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/multiplayerTeam.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}resinOptions.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/resinOptions.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/resinOptions.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/resinOptions.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}resinUsage.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/resinUsage.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/resinUsage.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/resinUsage.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}cap.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/cap.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/cap.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/cap.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}rechargeTime.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/rechargeTime.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/rechargeTime.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/rechargeTime.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}rates.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/rates.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/rates.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/rates.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}adventureExp.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/adventureExp.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/adventureExp.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/adventureExp.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}mora.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/mora.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/mora.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/mora.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}leyLines.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/leyLines.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/leyLines.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/leyLines.sh not found!"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}folderStructure.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/folderStructure/folderStructure.sh" ]; then
        source $GCAndroid/Edit_Config_Json/folderStructure/folderStructure.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/folderStructure/folderStructure.sh not found!"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}configjsonMain.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/configjsonMain.sh" ]; then
        source $GCAndroid/Edit_Config_Json/configjsonMain.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/configjsonMain.sh not found!"
        exit
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}resources.sh${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/folderStructure/resources.sh" ]; then
        source $GCAndroid/Edit_Config_Json/folderStructure/resources.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/folderStructure/resources.sh not found!"
        exit 1
    fi
}