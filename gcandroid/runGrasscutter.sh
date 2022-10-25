# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

# Permissions of this strong copyleft license are conditioned
# on making available complete source code of licensed works
# and modifications, which include larger works using a licensed work,
# under the same license.
# Copyright and license notices must be preserved.
# Contributors provide an express grant of patent rights.

GoTouchGrass() {
    credit_hah
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
        pkill mongo
        sudo service mongodb start
        cd $HOME/Grasscutter
        java -jar $HOME/Grasscutter/grasscutter.jar
    fi
}
