# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

GoTouchGrass() {
    credit_hah
    Center_Text "Go Touch Grass"
    if ! command -v mongo &>/dev/null; then
        echo "${RC}Please install mongodb First!${WC}"
        echo
        echo -n "Press enter for back to Menu!"
        read
        main_menu
        return
    fi
    if [[ ! -f $wherethegrassss ]]; then
        echo "${RC}Error${WC} : $wherethegrassss not found!"
        echo -n "Press enter for back to Menu!"
        read -r
        main_menu
        return
    else
        echo "${GC}Checking port used${WC}"
        timeout --foreground 2s php -S $(jq -r .server.http.accessAddress $HOME/Grasscutter/config.json):$(jq .server.http.bindPort $HOME/Grasscutter/config.json) &>/dev/null
        exitCode=$?
        if [[ $exitCode == 1 ]]; then
            echo "${RC}Error${WC} : Port $(jq .server.http.bindPort $HOME/Grasscutter/config.json) is used/permission denied!"
            echo "${YC}Server: $(jq -r .server.http.accessAddress $HOME/Grasscutter/config.json):$(jq .server.http.bindPort $HOME/Grasscutter/config.json)${WC}"
            echo
            echo -n "Press enter for back to Menu!"
            read -r
            main_menu
            return
        fi
        echo "${GC}Port $(jq .server.http.bindPort $HOME/Grasscutter/config.json) is not used!${WC}"
        pkill mongod
        mongod &>/dev/null &
        cd $HOME/Grasscutter
        java -jar $HOME/Grasscutter/grasscutter.jar
        echo -n "Press enter for back to Main Menu!"
        read -r
        main_menu
    fi
}
