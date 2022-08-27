changePort() {
    credit_hah
    if [ ! -f $configpath ]; then
        echo "${RC}Error${WC} : $configpath not found!"
        echo 
        echo -n "Press enter for back to Menu!"
        read
        main_menu
        return
    fi
    checkPort=$(cat $configpath | grep "\"bindPort\":" | head -n 1 | sed -e "s/.*\": //g" -e "s/,//g")
    echo "${CCB}Current Port : ${checkPort}${WC}"
    echo "====================================="
    echo "Enter b/B for back or cancel"
    echo -n "Enter port : "
    read -r PortChange
    if [[ $PortChange = "b" ]] || [[ $PortChange = "B" ]]; then
        main_menu
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
    if [[ $PortChange -lt 1025 ]]; then
        echo -e "${RC}Port $PortChange not allowed for Android\n${YC}Try Higher than 1024\n${WC}"
        echo -n "Press enter for try again!"
        read
        changePort
        return
    elif [[ $PortChange = "22102" ]]; then
        echo -e "${RC}Port ${PortChange} not allowed\n${YC}Reason ${WC}: ${CCB}Already used by Grasscutter Port${WC}"
        echo
        echo -n "Press enter for try again!"
        read
        changePort
        return
    fi
    sed -i "s/\"bindPort\": $checkPort,/\"bindPort\": $PortChange,/g" $configpath
    changePort
}