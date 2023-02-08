# Score-Inc/GCAndroid is licensed under the
# GNU General Public License v3.0

# Source code from my friend, aka @CharonCB21 on Telegram
# And the code already modified by me, aka @ElaXan on GitHub
removePlugin() {
    credit_hah
    pathPlugin="$grasscutter_path/plugins"
    if [ ! -d "$pathPlugin" ]; then
        echo "${RC}Folder $pathPlugin not found!${WC}"
        sleep 1s
        Grasscutter_Tools
    fi
    extension="jar"
    cd $pathPlugin
    dirlist=($(ls *.$extension 2>/dev/null))
    diramount=${#dirlist[@]}
    staticnum=0
    if [[ $diramount = 0 ]]; then
        echo "${YC}No plugins installed!${WC}"
        sleep 1s
        Grasscutter_Tools
    fi
    for fname in "${dirlist[@]}"; do
        staticnum=$(($staticnum + 1))
        echo "$staticnum. ${GC}$fname${WC}"
    done
    echo "0. ${RC}Back${WC}"
    echo
    printf "Your Option : "
    read userchoicef
    if [ $userchoicef -eq 0 ]; then
        Grasscutter_Tools
    elif [ $userchoicef -le $diramount ]; then
        curfile=${dirlist[$userchoicef - 1]}
        rm -rf $curfile
        echo "${GC}Successfully Removed plugin${WC} : ${CCB}$curfile!${WC}"
        sleep 1s
        removePlugin
    else
        echo "${RC}Invalid option!${WC}"
        sleep 1s
        removePlugin
    fi
}
