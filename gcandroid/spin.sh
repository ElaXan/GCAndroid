# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

# Source Code from StackOverflow
# And the code already modified by me, aka @ElaXan on GitHub
spin() {
    # Spin var
    spin[0]="-"
    spin[1]="\\"
    spin[2]="|"
    spin[3]="/"
    # Check for process
    while kill -0 "$pid" 2>/dev/null; do
        for i in "${spin[@]}"; do
            echo -ne "\r["
            echo -ne ${GC}"$i"
            echo -ne ${WC}"]" "$1"
            sleep 0.1
            trap '' INT
        done
        if ! (ps "$pid" &>/dev/null); then
            errCode=$(cat $HOME/z.log 2>/dev/null | grep "$catLogs_code")
            errOutput=$(cat $HOME/zerr.log 2>/dev/null)
            if [[ $errCode == $2 ]]; then
                echo -ne "\r[${GC}✓${WC}"
                echo
            else
                trap - INT
                echo -ne "\r[${RC}X${WC}] $1"
                echo -e "\n${RC}Failed output${WC}"
                echo
                echo "Reason :"
                echo "$errOutput"
                echo
                rm $HOME/zerr.log 2>/dev/null | echo "zerr.log : Log not found/script force stopped by User!"
                rm $HOME/z.log 2>/dev/null | echo "z.log : Log not found/script force stopped by User!"
                echo
                read -p "Press enter for back to $3!"
                $4
            fi
            rm $HOME/z.log
            rm $HOME/zerr.log
            trap - INT
        fi
    done
}

# Get Error Code
log() {
    echo -n "$1" >$HOME/z.log 2> /dev/null
    catLogs_code=$(cat "$HOME"/z.log 2>/dev/null | grep "$1")
}
