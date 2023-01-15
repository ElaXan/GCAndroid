# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

Loading() {
    pid=$!
    name=$1
    spin[0]="-"
    spin[1]="\\"
    spin[2]="|"
    spin[3]="/"
    index=0
    # :)
    echo

    while kill -0 $pid 2> /dev/null; do
        if [ -f "$HOME/zerr.log" ]; then
            Loading_Text=$(tail -n 1 $HOME/zerr.log)
        fi
        tput civis
        for i in "${spin[@]}"; do
            tput cuu1
            tput el
            if [ -z "$Loading_Text" ]; then
                # echo -ne "\r[${GC}$i${WC}] ${GC}$name${WC}\n\r"
                printf "\r[${GC}$i${WC}] ${GC}$name${WC}\n\r"
            else
                # echo -ne "\r[${GC}$i${WC}] ${GC}$name${WC}\n\033[2K\r > ${YC}$(echo $Loading_Text | cut -c 1-$(( $(tput cols) - 3 )))${WC}"
                printf "\r[${GC}$i${WC}] ${GC}$name${WC}\n\033[2K\r > ${YC}$(echo $Loading_Text | cut -c 1-$(( $(tput cols) - 3 )))${WC}"
            fi
            sleep 0.1
        done
        if ! (ps $pid > /dev/null); then
            tput cnorm
            errCode=$(cat $HOME/z.log 2>/dev/null | grep "$catLogs_code")
            errOutput=$(cat $HOME/zerr.log 2>/dev/null)
            if [[ $errCode == $2 ]]; then
                tput cuu1
                tput el
                printf "\r\033[2K[${GC}✓${WC}] ${GC}$name Done${WC}\n\r\033[2K\r"
                # echo -ne "\r\033[2K[${GC}✓${WC}] ${GC}$name Done${WC}\n\r\033[2K\r"
            else
                tput cuu1
                tput el
                echo -ne "\r[${RC}X${WC}] ${GC}$name${WC} ${RC}Failed${WC}\n\r\033[2K"
                if [ ${#errOutput} -gt 400 ]; then
                    echo -e "\n${RC}Error Output${WC} : \n\n$(echo $errOutput | tail -c 400)${WC}..."
                else
                    echo -e "\n${RC}Error Output${WC} : \n\n$errOutput${WC}"
                fi
                echo
                echo "${GC}Exit Code${WC} : ${RC}$errCode${WC}"
                echo "${GC}Exit Target${WC} : ${RC}$2${WC}"
                if [ $(cat $HOME/z.log) != $2 ]; then
                    echo -e "\n${YC}If this bug, please report it to Issues page${WC}"
                fi
                if [ -f $HOME/z.log ]; then
                    rm -rf $HOME/z.log 2>/dev/null || echo "z.log not found/script stopped by user"
                fi
                if [ -f $HOME/zerr.log ]; then
                    rm -rf $HOME/zerr.log 2>/dev/null || echo "zerr.log not found/script stopped by user"
                fi
                echo
                echo -n "Press enter for back to $3!"
                read
                $4
            fi
            tput cnorm
            rm -rf $HOME/z.log 2>/dev/null || echo "z.log not found/script stopped by user"
            rm -rf $HOME/zerr.log 2>/dev/null || echo "zerr.log not found/script stopped by user"
        fi
    done
}

# Run "Code_Program" "Progress_Name" "Exit_Code" "Back_To" "function_name"

log() {
    echo -n "$1" >$HOME/z.log 2> /dev/null
    catLogs_code=$(cat "$HOME"/z.log 2>/dev/null | grep "$1")
}

Run() {
    command=$1
    name=$2
    run_Program() {
        $command > $HOME/zerr.log 2>&1
        errCode=$?
        log $errCode
    }
    run_Program &
    Loading "$name" "$3" "$4" "$5"
}