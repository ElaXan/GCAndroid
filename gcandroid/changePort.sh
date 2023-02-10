# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

changePort() {
    credit_hah
    Center_Text "Change Port"
    if [ ! -f $configpath ]; then
        echo "${RC}Error${WC} : $configpath not found!"
        echo "See : ${CCU}${linksDocs}/Error#error-configjson-not-found${WC}"
        echo
        echo -n "Press enter for back to Menu!"
        read
        menu_config
        return
    fi
    checkPort=$(cat $configpath | grep "\"bindPort\":" | head -n 1 | sed -e "s/.*\": //g" -e "s/,//g")
    echo "${CCB}Current Port : ${checkPort}${WC}"
    echo "====================================="
    echo "${YC}Enter b/B for back or cancel${WC}"
    echo
    echo -n "Enter port : "
    read -r PortChange
    if [[ $PortChange = "b" ]] || [[ $PortChange = "B" ]]; then
        menu_config
        return
    fi
    if [[ $PortChange = "" ]]; then
        echo "${RC}Please enter Port!${WC}"
        echo
        echo -n "Press enter for try again!"
        read
        changePort
        return
    fi
    if [[ $PortChange == $checkPort ]]; then
        echo "${RC}Error:${WC} Port $PortChange already used!"
        echo
        echo -n "Press enter for try again!"
        read
        changePort
        return
    fi
    if nc localhost $PortChange; then
        echo "${RC}Error:${WC} Port $PortChange already used!"
        echo
        echo -n "Press enter for try again!"
        read
        changePort
        return
    fi
    sed -i "s/\"bindPort\": $checkPort,/\"bindPort\": $PortChange,/g" $configpath
    changePort
}
