# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

editCfgFunc() {
    enterInputEditGrass=$editConfJsonInp
    if [ $1 = "game" ]; then
        if [ $enterInputEditGrass = "1" ]; then
            EDfuncedit="\"enableShopItems\":"
            if [ $enableShopItems = true ]; then
                EDconfjson="true"
                EDconfjsonTo="false"
            elif [ $enableShopItems = false ]; then
                EDconfjson="false"
                EDconfjsonTo="true"
            fi
        elif [ $enterInputEditGrass = "2" ]; then
            EDfuncedit="\"energyUsage\":"
            if [ $energyUsage = true ]; then
                EDconfjson="true"
                EDconfjsonTo="false"
            elif [ $energyUsage = false ]; then
                EDconfjson="false"
                EDconfjsonTo="true"
            fi
        elif [ $enterInputEditGrass = "3" ]; then
            EDfuncedit="\"enableScriptInBigWorld\":"
            if [ $enableScriptInBigWorld = true ]; then
                EDconfjson="true"
                EDconfjsonTo="false"
            elif [ $enableScriptInBigWorld = false ]; then
                EDconfjson="false"
                EDconfjsonTo="true"
            fi
        elif [ $enterInputEditGrass = "4" ]; then
            EDfuncedit="\"enableConsole\":"
            if [ $enableConsole = true ]; then
                EDconfjson="true"
                EDconfjsonTo="false"
            elif [ $enableConsole = false ]; then
                EDconfjson="false"
                EDconfjsonTo="true"
            fi
        elif [ $enterInputEditGrass = "5" ]; then
            EDfuncedit="\"staminaUsage\":"
            if [ $staminaUsage = true ]; then
                EDconfjson="true"
                EDconfjsonTo="false"
            elif [ $staminaUsage = false ]; then
                EDconfjson="false"
                EDconfjsonTo="true"
            fi
        elif [ $enterInputEditGrass = "6" ]; then
            EDfuncedit="\"watchGachaConfig\":"
            if [ $watchGachaConfig = true ]; then
                EDconfjson="true"
                EDconfjsonTo="false"
            elif [ $watchGachaConfig = false ]; then
                EDconfjson="false"
                EDconfjsonTo="true"
            fi
        fi
    fi

    if [ $1 = "account" ]; then
        if [ $enterInputEditGrass = "1" ]; then
            EDfuncedit="\"autoCreate\":"
            if [ $autoCreate = true ]; then
                EDconfjson="true"
                EDconfjsonTo="false"
            elif [ $autoCreate = false ]; then
                EDconfjson="false"
                EDconfjsonTo="true"
            fi
        fi

        if [ $enterInputEditGrass = "2" ]; then
            EDfuncedit="\"EXPERIMENTAL_RealPassword\":"
            if [ $EXPERIMENTAL_RealPassword = true ]; then
                EDconfjson="true"
                EDconfjsonTo="false"
            elif [ $EXPERIMENTAL_RealPassword = false ]; then
                EDconfjson="false"
                EDconfjsonTo="true"
            fi
        fi

        if [ $enterInputEditGrass = "3" ]; then
            EDfuncedit="\"maxPlayer\":"
            EDconfjson="$maxPlayer"
            echo -n "Enter amount maxPlayer : "
            echo
            read -r editCfgFunc_input
            if [ $editCfgFunc_input = $maxPlayer ]; then
                echo -e "${RC}Failed edit\n${YC}Reason${WC} : Same amount"
                echo -n "Press enter for back to Menu Config!"
                read
                menu_config_account
            else
                EDconfjsonTo="$editCfgFunc_input"
            fi
        fi
    fi

    if [ $1 = "serverAccount" ]; then
        if [ $enterInputEditGrass = "1" ]; then
            menu_detect_false_true "game"
            credit_hah
            line12 "avatarId Edit"
            echo "${GC}Current avatarId :${WC}"
            echo "${CCB}$avatarId${WC}"
            echo
            echo "${YC}Enter b/B for back${WC}"
            echo -n "Enter custom avatarId : ${CCB}"
            read -r editCfgFunc_input
            echo -n "${WC}"
            if [[ $editCfgFunc_input = "b" ]] || [[ $editCfgFunc_input = "B" ]]; then
                menu_config_game_serverAccount
            fi
            if [[ $editCfgFunc_input = $avatarId ]]; then
                echo "${RC}Error${WC} : Same avatarId"
                sleep 1s
                editCfgFunc "serverAccount"
            fi
            EDfuncedit="\"avatarId\":"
            EDconfjson="$avatarId"
            EDconfjsonTo="$editCfgFunc_input"
        fi

        if [ $enterInputEditGrass = "2" ]; then
            menu_detect_false_true "game"
            credit_hah
            line12 "nameCardId Edit"
            echo "${GC}Current nameCardId : ${WC}"
            echo "${CCB}$nameCardId${WC}"
            echo
            echo "${YC}Enter b/B for back${WC}"
            echo -n "Enter custom nameCardId : ${CCB}"
            read -r editCfgFunc_input
            echo -n "${WC}"
            if [[ $editCfgFunc_input = "b" ]] || [[ $editCfgFunc_input = "B" ]]; then
                menu_config_game_serverAccount
            fi
            if [[ $editCfgFunc_input = $nameCardId ]]; then
                echo "${RC}Error${WC} : Same nameCardId"
                sleep 1s
                editCfgFunc "serverAccount"
            fi
            EDfuncedit="\"nameCardId\":"
            EDconfjson="$nameCardId"
            EDconfjsonTo="$editCfgFunc_input"
        fi

        if [ $enterInputEditGrass = "3" ]; then
            menu_detect_false_true "game"
            credit_hah
            line9 "adventureRank Edit"
            echo "${GC}Current adventureRank : ${WC}"
            echo "${CCB}$adventureRank${WC}"
            echo
            echo "${YC}Enter b/B for back${WC}"
            echo -n "Enter custom adventureRank : ${CCB}"
            read -r editCfgFunc_input
            echo -n "${WC}"
            if [[ $editCfgFunc_input = "b" ]] || [[ $editCfgFunc_input = "B" ]]; then
                menu_config_game_serverAccount
            fi
            if [[ $editCfgFunc_input = $adventureRank ]]; then
                echo "${RC}Error${WC} : Same adventureRank"
                sleep 1s
                editCfgFunc "serverAccount"
            fi
            EDfuncedit="\"adventureRank\":"
            EDconfjson="$adventureRank"
            EDconfjsonTo="$editCfgFunc_input"
        fi

        if [ $enterInputEditGrass = "5" ]; then
            menu_detect_false_true "game"
            credit_hah
            line12 "nickName Edit"
            echo "${GC}Current nickName :${WC}"
            echo "${CCB}$nickName${WC}"
            echo
            echo "${YC}Enter b/B for back${WC}"
            echo -n "Enter custom nickname : ${CCB}"
            read -r editCfgFunc_input
            echo -n "${WC}"
            if [[ $editCfgFunc_input = "b" ]] || [[ $editCfgFunc_input = "B" ]]; then
                menu_config_game_serverAccount
            fi
            if [[ $editCfgFunc_input = $nickName ]]; then
                echo "${RC}Error${WC} : Same nickName"
                sleep 1s
                editCfgFunc "serverAccount"
            fi
            EDfuncedit="\"nickName\":"
            EDconfjson="\"$nickName\""
            EDconfjsonTo="\"$editCfgFunc_input\""
        fi
    fi

    if [ $1 = "joinOptions" ]; then
        if [ $enterInputEditGrass = "1" ]; then
            menu_detect_false_true "joinOptions"
            credit_hah
            # Done Center
            line9 "WelcomeMessage Edit"
            echo "${GC}Current welcomeMessage :${WC}"
            echo "${CCB}$welcomeMessage${WC}"
            echo
            echo "${YC}Enter a/A for Help"
            echo "Enter b/B for back or cancel${WC}"
            echo
            echo "Enter custom welcomeMessage :${CCB}"
            read editCfgFunc_input
            echo -n ${WC}
            if [[ $editCfgFunc_input = "b" ]] || [[ $editCfgFunc_input = "B" ]]; then
                menu_config_game_joinOptions
            elif [[ $editCfgFunc_input = "a" ]] || [[ $editCfgFunc_input = "A" ]]; then
                menu_config_game_help_back="joinOptions"
                menu_config_game_help
            elif [[ $editCfgFunc_input = "" ]]; then
                echo "${RC}Please enter custom welcomeMessage!${WC}"
                sleep 1s
                editCfgFunc "joinOptions"
            fi
            if [[ $welcomeMessage = $editCfgFunc_input ]]; then
                echo -e "${RC}Failed Edit${YC}\nReason${WC} : Same welcomeMessage"
                echo -n "Press enter for try again"
                read
                editCfgFunc "joinOptions"
                return
            fi
            EDfuncedit="\"welcomeMessage\":"
            EDconfjson="\"$welcomeMessage\""
            EDconfjsonTo="\"$editCfgFunc_input\""
        fi
    fi

    if [ $1 = "joinOptions_welcomeMail" ]; then
        if [ $enterInputEditGrass = "1" ]; then
            menu_detect_false_true "joinOptions_welcomeMail"
            credit_hah
            # Done Center
            line10 "welcomeMail Edit"
            echo "${GC}Current title :${CCB}"
            echo "$welcomeMail_title"
            echo
            echo "${YC}Enter a/A for Help"
            echo "Enter b/B for back or cancel${WC}"
            echo
            echo "Enter custom title :${CCB}"
            read editCfgFunc_input
            echo -n "${WC}"
            if [[ $editCfgFunc_input = "b" ]] || [[ $editCfgFunc_input = "B" ]]; then
                menu_config_game_joinOptions_welcomeMail
            elif [[ $editCfgFunc_input = "a" ]] || [[ $editCfgFunc_input = "A" ]]; then
                menu_config_game_help_back="welcomeMail"
                menu_config_game_help
            elif [[ $editCfgFunc_input = "" ]]; then
                echo "${RC}Please enter custom title!${WC}"
                sleep 1s
                editCfgFunc "joinOptions_welcomeMail"
            fi
            if [[ $welcomeMail_title = $editCfgFunc_input ]]; then
                echo -e "${RC}Failed Edit${YC}\nReason${WC} : Same title"
                echo -n "Press enter for try again"
                read
                editCfgFunc "joinOptions_welcomeMail"
                return
            fi
            EDfuncedit="\"title\":"
            EDconfjson="\"$welcomeMail_title\""
            EDconfjsonTo="\"$editCfgFunc_input\""
        fi

        if [ $enterInputEditGrass = "2" ]; then
            menu_detect_false_true "joinOptions_welcomeMail"
            clear
            credit_hah
            # Done Center
            line12 "${GC}Content Edit${GC}"
            echo "${GC}Current content :${CCB}"
            echo "$welcomeMail_content"
            echo
            echo "${YC}Enter a/A for Help"
            echo "Enter b/B for back or cancel${WC}"
            echo
            echo "Enter custom content :${CCB}"
            read -r editCfgFunc_input
            echo -n "${WC}"
            if [[ $editCfgFunc_input = "b" ]] || [[ $editCfgFunc_input = "B" ]]; then
                menu_config_game_joinOptions_welcomeMail
            elif [[ $editCfgFunc_input = "a" ]] || [[ $editCfgFunc_input = "A" ]]; then
                menu_config_game_help_back="welcomeMail"
                menu_config_game_help
            elif [[ $editCfgFunc_input = "" ]]; then
                echo "${RC}Please enter custom content!${WC}"
                sleep 1s
                editCfgFunc "joinOptions_welcomeMail"
            fi
            if [[ $welcomeMail_content = $editCfgFunc_input ]]; then
                echo -e "${RC}Failed Edit${YC}\nReason${WC} : Same content"
                echo -n "Press enter for try again"
                read
                editCfgFunc "joinOptions_welcomeMail"
                return
            fi
            EDfuncedit="\"content\":"
            EDconfjson="\".*\""
            EDconfjsonTo="\"$editCfgFunc_input\""
        fi

        if [ $enterInputEditGrass = "3" ]; then
            menu_detect_false_true "joinOptions_welcomeMail"
            clear
            credit_hah
            # Done Center
            line13 "${GC}Sender Edit${WC}"
            echo "${GC}Current sender :${CCB}"
            echo "$welcomeMail_sender"
            echo
            echo "${YC}Enter b/B for back or cancel${WC}"
            echo
            echo -n "Enter custom sender :${CCB} "
            read -r editCfgFunc_input
            echo -n "${WC}"
            if [[ $editCfgFunc_input = "b" ]] || [[ $editCfgFunc_input = "B" ]]; then
                menu_config_game_joinOptions_welcomeMail
            elif [[ $editCfgFunc_input = "" ]]; then
                echo "${RC}Please enter custom sender!${WC}"
                sleep 1s
                editCfgFunc "joinOptions_welcomeMail"
            fi
            if [[ $welcomeMail_sender = $editCfgFunc_input ]]; then
                echo -e "${RC}Failed Edit${YC}\nReason${WC} : Same sender"
                echo -n "Press enter for try again"
                read
                editCfgFunc "joinOptions_welcomeMail"
                return
            fi
            EDfuncedit="\"sender\":"
            EDconfjson="\".*\""
            EDconfjsonTo="\"$editCfgFunc_input\""
        fi
    fi

    sed -i "s/$EDfuncedit $EDconfjson/$EDfuncedit $EDconfjsonTo/" $configpath
    if [ $menu_config_back = "game" ]; then
        menu_config_game
    elif [ $menu_config_back = "account" ]; then
        menu_config_account
    elif [ $menu_config_back = "joinOptions" ]; then
        editCfgFunc "joinOptions"
    elif [ $menu_config_back = "joinOptions_welcomeMail" ]; then
        editCfgFunc "joinOptions_welcomeMail"
    elif [ $menu_config_back = "serverAccount" ]; then
        editCfgFunc "serverAccount"
    fi
}
