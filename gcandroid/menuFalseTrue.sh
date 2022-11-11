# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

menu_detect_false_true() {
    if [ $1 = "game" ]; then
        enableShopItems=$(cat "$configpath" | grep "\"enableShopItems\":" | sed -e "s/.*\"enableShopItems\": //g" -e "s/,//g")
        energyUsage=$(cat "$configpath" | grep "\"energyUsage\":" | sed -e "s/.*\"energyUsage\": //g" -e "s/,//g")
        enableScriptInBigWorld=$(cat "$configpath" | grep "\"enableScriptInBigWorld\":" | sed -e "s/.*\"enableScriptInBigWorld\": //g" -e "s/,//g")
        enableConsole=$(cat "$configpath" | grep "\"enableConsole\":" | sed -e "s/.*\"enableConsole\": //g" -e "s/,//g")
        staminaUsage=$(cat "$configpath" | grep "\"staminaUsage\":" | sed -e "s/.*\"staminaUsage\": //g" -e "s/,//g")
        watchGachaConfig=$(cat "$configpath" | grep "\"watchGachaConfig\":" | sed -e "s/.*\"watchGachaConfig\": //g" -e "s/,//g")
        nickName=$(cat "$configpath" | grep "\"nickName\"" | sed -e "s/.*\"nickName\": \"//g" -e "s/\",//g")
    fi

    if [ $1 = "account" ]; then
        autoCreate=$(cat "$configpath" | grep "\"autoCreate\":" | sed -e "s/.*\"autoCreate\": //g" -e "s/,//g")
        EXPERIMENTAL_RealPassword=$(cat "$configpath" | grep "\"EXPERIMENTAL_RealPassword\":" | sed -e "s/.*\"EXPERIMENTAL_RealPassword\": //g" -e "s/,//g")
        maxPlayer=$(cat "$configpath" | grep "\"maxPlayer\":" | sed "s/.*\"maxPlayer\": //g")
        defaultPermissions_list=$(cat $HOME/Grasscutter/src/main/java/emu/grasscutter/command/commands/* | grep "permission = \"" | sed -e "s/.*= \"//g" -e "s/\",//g" -e "s/\")//g" -e "s/ =.*//g")
        defaultPermissions=$(cat "$configpath" | grep "\"defaultPermissions\":" | sed -e "s/.*\": \[//g" -e "s/\],//g")
    fi

    if [ $1 = "joinOptions" ]; then
        welcomeMessage=$(cat "$configpath" | grep "\"welcomeMessage\":" | sed -e "s/.*: \"//g" -e "s/\"//g" -e "s/,//g")
    fi

    if [ $1 = "joinOptions_welcomeMail" ]; then
        welcomeMail_title=$(cat "$configpath" | grep "\"title\":" | sed -e "s/.*\"title\": //g" -e "s/\"//g" -e "s/,//g")
        welcomeMail_content=$(cat "$configpath" | grep "\"content\"" | sed -e "s/.*\"content\": \"//g" -e "s/\",//g")
        welcomeMail_sender=$(cat "$configpath" | grep "\"sender\":" | sed -e "s/.*\"sender\": \"//g" -e "s/\",//g")
    fi

    if [ $1 = "game" ]; then
        if [ $enableShopItems = true ]; then
            TRenableShopItems="${GC}True${WC}"
        elif [ $enableShopItems = false ]; then
            TRenableShopItems="${RC}False${WC}"
        fi

        if [ $energyUsage = true ]; then
            TRenergyUsage="${GC}True${WC}"
        elif [ $energyUsage = false ]; then
            TRenergyUsage="${RC}False${WC}"
        fi

        if [ $enableScriptInBigWorld = true ]; then
            TRenableScriptInBigWorld="${GC}True${WC}"
        elif [ $enableScriptInBigWorld = false ]; then
            TRenableScriptInBigWorld="${RC}False${WC}"
        fi

        if [ $enableConsole = true ]; then
            TRenableConsole="${GC}True${WC}"
        elif [ $enableConsole = false ]; then
            TRenableConsole="${RC}False${WC}"
        fi

        if [ $staminaUsage = true ]; then
            TRstaminaUsage="${GC}True${WC}"
        elif [ $staminaUsage = false ]; then
            TRstaminaUsage="${RC}False${WC}"
        fi

        if [ $watchGachaConfig = true ]; then
            TRwatchGachaConfig="${GC}True${WC}"
        elif [ $watchGachaConfig = false ]; then
            TRwatchGachaConfig="${RC}False${WC}"
        fi
    fi

    if [ $1 = "account" ]; then
        if [ $autoCreate = true ]; then
            TRautoCreate="${GC}True${WC}"
        elif [ $autoCreate = false ]; then
            TRautoCreate="${RC}False${WC}"
        fi

        if [ $EXPERIMENTAL_RealPassword = true ]; then
            TREXPERIMENTAL_RealPassword="${GC}True${WC}"
        elif [ $EXPERIMENTAL_RealPassword = false ]; then
            TREXPERIMENTAL_RealPassword="${RC}False${WC}"
        fi

        TRmaxPlayer=${GC}$maxPlayer${WC}

    fi

    if [ $1 = "joinOptionsl" ]; then
        TRwelcomeMessage=$welcomeMessage
    fi

    if [ $1 = "joinOptions_welcomeMail" ]; then
        TRwelcomeMail=$welcomeMail
        TRwelcomeMail_content=$welcomeMail_content
        TRwelcomeMail_sender=$welcomeMail_sender
    fi
}
