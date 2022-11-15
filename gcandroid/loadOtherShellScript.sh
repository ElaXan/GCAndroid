loadOtherShellScript() {
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}changePort.sh [1]${WC}";
    if [ -f "$GCAndroid/changePort.sh" ]; then
        source $GCAndroid/changePort.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/changePort.sh not found"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}installGrasscutter.sh [3]${WC}";
    if [ -f "$GCAndroid/installGrasscutter.sh" ]; then
        source $GCAndroid/installGrasscutter.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/installGrasscutter.sh not found"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}menuFalseTrue.sh [4]${WC}";
    if [ -f "$GCAndroid/menuFalseTrue.sh" ]; then
        source $GCAndroid/menuFalseTrue.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/menuFalseTrue.sh not found"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}runGrasscutter.sh [5]${WC}";
    if [ -f "$GCAndroid/runGrasscutter.sh" ]; then
        source $GCAndroid/runGrasscutter.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/runGrasscutter.sh not found"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}spin.sh [6]${WC}";
    if [ -f "$GCAndroid/spin.sh" ]; then
        source $GCAndroid/spin.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/spin.sh not found"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}installPlugin.sh [7]${WC}";
    if [ -f "$GCAndroid/installPlugin.sh" ]; then
        source $GCAndroid/installPlugin.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/installPlugin.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}removePlugin.sh [8]${WC}";
    if [ -f "$GCAndroid/removePlugin.sh" ]; then
        source $GCAndroid/removePlugin.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/removePlugin.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}compileGrasscutter.sh [9]${WC}";
    if [ -f "$GCAndroid/compileGrasscutter.sh" ]; then
        source $GCAndroid/compileGrasscutter.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/compileGrasscutter.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}generateHandbook.sh [10]${WC}";
    if [ -f "$GCAndroid/generateHandbook.sh" ]; then
        source $GCAndroid/generateHandbook.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/generateHandbook.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}editConfigJson.sh [11]${WC}";
    if [ -f "$GCAndroid/editConfigJson.sh" ]; then
        source $GCAndroid/editConfigJson.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/editConfigJson.sh not found"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}getConfigjson.sh [12]${WC}";
    if [ -f "$GCAndroid/getConfigjson.sh" ]; then
        source $GCAndroid/getConfigjson.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/getConfigjson.sh not found"
        exit 1
    fi

    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}Server.sh [13]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/Server.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/Server.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/Server.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}logcommands.sh [14]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/logcommands.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/logcommands.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/logcommands.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}runMode.sh [15]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/runMode.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/runMode.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/runMode.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}Http.sh [16]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/Http.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/Http.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/Http.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}bindAddress.sh [17]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/bindAddress.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/bindAddress.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/bindAddress.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}accessAddress.sh [18]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/accessAddress.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/accessAddress.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/accessAddress.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}accessPort.sh [19]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/accessPort.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/accessPort.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/accessPort.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}encryption.sh [20]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/encryption/encryption.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/encryption/encryption.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/encryption/encryption.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}useEncryption.sh [21]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/encryption/useEncryption.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/encryption/useEncryption.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/encryption/useEncryption.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}useInRouting.sh [22]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/encryption/useInRouting.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/encryption/useInRouting.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/encryption/useInRouting.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}keystore.sh [23]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/encryption/keystore.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/encryption/keystore.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/encryption/keystore.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}keystorePassword.sh [24]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/encryption/keystorePassword.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/encryption/keystorePassword.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/encryption/keystorePassword.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}policies.sh [25]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/policies/policies.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/policies/policies.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/policies/policies.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}cors.sh [26]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/policies/cors/cors.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/policies/cors/cors.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/policies/cors/cors.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}enabled.sh [27]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/policies/cors/enabled.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/policies/cors/enabled.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/policies/cors/enabled.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}cores.sh [28]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/policies/cores/cores.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/policies/cores/cores.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/policies/cores/cores.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}enbaled.sh [29]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/policies/cores/enbaled.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/policies/cores/enbaled.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/policies/cores/enbaled.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}enabled.sh [30]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/policies/cores/enabled.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/policies/cores/enabled.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/policies/cores/enabled.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}files.sh [31]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/files/files.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/files/files.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/files/files.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}indexFile.sh [32]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/files/indexFile.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/files/indexFile.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}Edit_Config_Json/Server/http/files/indexFile.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}errorFile.sh [33]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/http/files/errorFile.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/http/files/errorFile.sh
    else
        echo "${GC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/http/files/errorFile.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}game.sh [34]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/game.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/game.sh
    else
        echo "${GC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/game.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}bindAddress.sh [35]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/bindAddress.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/bindAddress.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/bindAddress.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}bindPort.sh [36]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/bindPort.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/bindPort.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/bindPort.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}accessAddress.sh [37]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/accessAddress.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/accessAddress.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/accessAddress.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}accessPort.sh [38]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/accessPort.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/accessPort.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/accessPort.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}loadEntitiesForPlayerRange.sh [39]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/loadEntitiesForPlayerRange.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/loadEntitiesForPlayerRange.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/loadEntitiesForPlayerRange.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}enableScriptInBigWorld.sh [40]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/enableScriptInBigWorld.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/enableScriptInBigWorld.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/enableScriptInBigWorld.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}enableConsole.sh [41]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/enableConsole.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/enableConsole.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/enableConsole.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}kcpInterval.sh [42]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/kcpInterval.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/kcpInterval.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/kcpInterval.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}logPackets.sh [43]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/logPackets.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/logPackets.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/logPackets.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}isShowPacketPayload.sh [44]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/isShowPacketPayload.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/isShowPacketPayload.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/isShowPacketPayload.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}isShowLoopPackets.sh [45]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/isShowLoopPackets.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/isShowLoopPackets.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/isShowLoopPackets.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}gameOptions.sh [46]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/gameOptions.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/gameOptions.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/gameOptions.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}sceneEntityLimit.sh [47]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/sceneEntityLimit.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/sceneEntityLimit.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/sceneEntityLimit.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}watchGachaConfig.sh [48]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/watchGachaConfig.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/watchGachaConfig.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/watchGachaConfig.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}enableShopItems.sh [49]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/enableShopItems.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/enableShopItems.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/enableShopItems.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}staminaUsage.sh [50]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/staminaUsage.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/staminaUsage.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/staminaUsage.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}energyUsage.sh [51]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/energyUsage.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/energyUsage.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/energyUsage.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}fishhookTeleport.sh [52]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/fishhookTeleport.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/fishhookTeleport.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/fishhookTeleport.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}inventoryLimits.sh [53]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/inventoryLimits.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/inventoryLimits.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/inventoryLimits.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}weapons.sh [54]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/weapons.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/weapons.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/weapons.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}relics.sh [55]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/relics.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/relics.sh
    else
        echo "${RC}Error${WC} : ${GCAndroid}/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/relics.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}materials.sh [56]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/materials.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/materials.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/materials.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}furniture.sh [57]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/furniture.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/furniture.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/furniture.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}all.sh [58]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/all.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/all.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/inventoryLimits/all.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}avatarLimits.sh [59]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/avatarLimits.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/avatarLimits.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/avatarLimits.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}singlePlayerTeam.sh [60]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/singlePlayerTeam.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/singlePlayerTeam.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/singlePlayerTeam.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}multiplayerTeam.sh [61]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/multiplayerTeam.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/multiplayerTeam.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/avatarLimits/multiplayerTeam.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}resinOptions.sh [62]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/resinOptions.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/resinOptions.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/resinOptions.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}resinUsage.sh [63]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/resinUsage.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/resinUsage.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/resinUsage.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}cap.sh [64]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/cap.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/cap.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/cap.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}rechargeTime.sh [65]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/rechargeTime.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/rechargeTime.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/resinOptions/rechargeTime.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}rates.sh [66]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/rates.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/rates.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/rates.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}adventureExp.sh [67]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/adventureExp.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/adventureExp.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/adventureExp.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}mora.sh [68]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/mora.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/mora.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/mora.sh not found!"
        exit 1
    fi
    
    echo -en "\033[2K\r${GC}Load${WC} : ${CCB}leyLines.sh [69]${WC}";
    if [ -f "$GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/leyLines.sh" ]; then
        source $GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/leyLines.sh
    else
        echo "${RC}Error${WC} : $GCAndroid/Edit_Config_Json/Server/game/gameOptions/rates/leyLines.sh not found!"
        exit 1
    fi
}