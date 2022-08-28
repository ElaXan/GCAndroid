spin() {
    # Spin var
    spin[0]="-"
    spin[1]="\\"
    spin[2]="|"
    spin[3]="/"
    # Check for process
    while kill -0 "$pid" 2> /dev/null; do
        for i in "${spin[@]}"; do
            echo -ne "\r[";
            echo -ne ${GC}"$i";
            echo -ne ${WC}"]" "$1"; sleep 0.1;
            trap '' INT
        done
        # Adding checklist or "✓" for more good by me XD
        if ! (ps "$pid" &> /dev/null); then
            errCode=$(cat $HOME/z.log | grep "$catLogs_code")
            errOutput=$(cat $HOME/zerr.log)
            if [ $errCode = 0 ]; then
                echo -ne "\r[${GC}✓${WC}"
                echo
            else
                trap - INT
                echo -ne "\r[${RC}X${WC}"
                echo -e "\n${RC}Failed output${WC}"
                echo
                echo "Reason :"
                echo "$errOutput"
                echo
                rm $HOME/zerr.log
                rm $HOME/z.log
                read -p "Press enter for back to $2!"
                $3
            fi
            rm $HOME/z.log
            rm $HOME/zerr.log
            trap - INT
        fi
    done
}

# Get Error Code
log() {
    echo -n "$1" > $HOME/z.log
    catLogs_code=$(cat "$HOME"/z.log | grep "$1")
}