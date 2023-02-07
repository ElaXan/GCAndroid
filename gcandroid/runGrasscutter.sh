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
        # Read config values into variables
        config_file="$HOME/Grasscutter/config.json"
        if [[ -f $config_file ]]; then
            access_address=$(jq -r .server.http.accessAddress $config_file)
            bind_port=$(jq .server.http.bindPort $config_file)

            echo "${GC}Checking port used${WC}"
            timeout --foreground 2s php -S $access_address:$bind_port &>/dev/null
            exitCode=$?
            if [[ $exitCode == 1 ]]; then
                echo "${RC}Error${WC} : Port $bind_port is used/permission denied!"
                echo "${YC}Server: $access_address:$bind_port${WC}"
                echo
                echo -n "Press enter for back to Menu!"
                read -r
                main_menu
                return
            fi
            echo "${GC}Port $bind_port is not used!${WC}"
        fi
        if pgrep mongod > /dev/null; then
            pkill mongod
        fi
        mongod --logpath $HOME/mongodb.log &>/dev/null &
        cd $HOME/Grasscutter
        java -jar $HOME/Grasscutter/grasscutter.jar
        echo -n "Press enter for back to Main Menu!"
        read -r
        main_menu
    fi
}
