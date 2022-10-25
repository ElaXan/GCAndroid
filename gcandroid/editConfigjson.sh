# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

# Permissions of this strong copyleft license are conditioned
# on making available complete source code of licensed works
# and modifications, which include larger works using a licensed work,
# under the same license.
# Copyright and license notices must be preserved.
# Contributors provide an express grant of patent rights.

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

    if [ $1 = "joinOptions" ]; then
        if [ $enterInputEditGrass = "1" ]; then
            menu_detect_false_true "joinOptions"
            credit_hah
            echo "${GC}${space2}WelcomeMessage Edit${WC}"
            echo "${line}"
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
            echo "${GC}${space2}welcomeMail Edit${WC}"
            echo "${line}"
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
            echo "${GC}${space2}Content Edit${WC}"
            echo "${line}"
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
            echo "${GC}${space2}Sender Edit${WC}"
            echo "${line}"
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
    fi
}
