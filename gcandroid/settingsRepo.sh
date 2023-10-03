GrasscutterRepo() {
    credit_hah
    get_current_gc_repo=$(jq -r '.Grasscutter' "$Path_Repojson")
    echo "${CCB}Current Grasscutter repository: ${GC}$get_current_gc_repo${WC}"
    echo
    echo "${YC}Enter b/B to go back to the main menu${WC}"
    echo
    printf "Enter new Grasscutter repository: "
    read -r new_gc_repo
    echo
    if [ "$new_gc_repo" = "b" ] || [ "$new_gc_repo" = "B" ]; then
        settingsMenu
    fi

    if [ "$new_gc_repo" = "" ]; then
        echo "${RC}You must enter a repository${WC}"
        echo
        printf "Press enter to try again"
        read -r
        GrasscutterRepo
    fi
    jq .Grasscutter=\""$new_gc_repo"\" "$Path_Repojson" > "$GCAndroid/ZEdit.json"
    rm "$Path_Repojson"
    mv "$HOME/.ElaXan/GCAndroid/ZEdit.json" "$Path_Repojson"
    echo "${GC}Grasscutter repository changed to: $new_gc_repo${WC}"
    echo
    echo "${CCB}Restarting GCAndroid${WC}"
    sleep 2s
    gcandroid
}

JarDownload() {
    credit_hah
    get_current_jar_download_repo=$(jq -r '.JarDownload' "$Path_Repojson")
    echo "${CCB}Current Jar Link Download: ${GC}$get_current_jar_download_repo${WC}"
    echo
    echo "${YC}Enter b/B to go back to the main menu${WC}"
    echo
    printf "Enter new Jar Download link: "
    read -r new_jar_download_link
    echo
    if [ "$new_jar_download_link" = "b" ] || [ "$new_jar_download_link" = "B" ]; then
        settingsMenu
    elif [ "$new_jar_download_link" = "" ]; then
        echo "${RC}You must enter a download link .jar${WC}"
        echo
        printf "Press enter to try again"
        echo -r
        JarDownload
    fi
    jq .JarDownload=\""$new_jar_download_link"\" "$Path_Repojson" > "$HOME/.ElaXan/GCAndroid/ZEdit.json"
    rm "$Path_Repojson"
    mv "$HOME/.ElaXan/GCAndroid/ZEdit.json" "$Path_Repojson"
    echo "${GC}Java Download link changed to: ${new_jar_download_link}"
    echo
    echo "${CCB}Restarting GCAndroid${WC}"
    sleep 2s
    gcandroid
}

ResourcesRepo() {
    credit_hah
    get_current_resources_repo=$(jq -r '.Resources' "$Path_Repojson")
    echo "${CCB}Current Resources repository: ${GC}$get_current_resources_repo${WC}"
    echo
    echo "${YC}Enter b/B to go back to the main menu${WC}"
    echo
    printf "Enter new Resources repository: "
    read -r new_resources_repo
    echo
    if [ "$new_resources_repo" = "b" ] || [ "$new_resources_repo" = "B" ]; then
        settingsMenu
    fi
    if [ "$new_resources_repo" = "" ]; then
        echo "${RC}You must enter a repository${WC}"
        echo
        printf "Press enter to try again"
        read -r
        ResourcesRepo
    fi
    jq .Resources=\""$new_resources_repo"\" "$Path_Repojson" > "$HOME/.ElaXan/GCAndroid/ZEdit.json"
    rm "$Path_Repojson"
    mv "$GCAndroid/ZEdit.json" "$Path_Repojson"
    echo "${GC}Resources repository changed to: $new_resources_repo${WC}"
    echo
    echo "${CCB}Restarting GCAndroid${WC}"
    sleep 2s
    gcandroid
}

ResetSettingsJSON() {
    credit_hah
    echo "${RC}This will reset the repo.json file to the default settings${WC}"
    echo
    printf "Are you sure you want to continue? (y/n): "
    read -r reset_settings_json
    echo
    if [ "$reset_settings_json" = "y" ] || [ "$reset_settings_json" = "Y" ]; then
        rm "$Path_Repojson"
        echo "{
    \"Grasscutter\": \"https://github.com/Grasscutters/Grasscutter.git\",
    \"JarDownload\": \"https://github.com/Grasscutters/Grasscutter/releases/download/v1.6.0/grasscutter.jar\",
    \"Resources\": \"https://gitlab.com/YuukiPS/GC-Resources/-/archive/3.4/GC-Resources-3.4.zip\"
}" > "$Path_Repojson"
        echo "${GC}repo.json file reset to default settings${WC}"
        echo
        echo "${CCB}Restarting GCAndroid${WC}"
        sleep 2s
        gcandroid
    fi
    if [ "$reset_settings_json" = "n" ] || [ "$reset_settings_json" = "N" ]; then
        settingsMenu
    fi
    if [ "$reset_settings_json" != "y" ] && [ "$reset_settings_json" != "Y" ] && [ "$reset_settings_json" != "n" ] && [ "$reset_settings_json" != "N" ]; then
        echo "${RC}You must enter y/Y or n/N${WC}"
        echo
        printf "Press enter to try again"
        read -r
        ResetSettingsJSON
    fi
}