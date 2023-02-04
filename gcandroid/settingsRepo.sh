GrasscutterRepo() {
    credit_hah
    get_current_gc_repo=$(jq -r '.Grasscutter' "$HOME/.ElaXan/GCAndroid/repo.json")
    echo "${CCB}Current Grasscutter repository: ${GC}$get_current_gc_repo${WC}"
    echo
    echo "${YC}Enter b/B to go back to the main menu${WC}"
    echo
    echo -n "Enter new Grasscutter repository: "
    read -r new_gc_repo
    echo
    if [[ "$new_gc_repo" == "b" ]] || [[ "$new_gc_repo" == "B" ]]; then
        settingsMenu
    fi
    if [[ "$new_gc_repo" == "" ]]; then
        echo "${RC}You must enter a repository${WC}"
        echo
        echo -n "Press enter to try again"
        read -r
        GrasscutterRepo
    fi
    jq .Grasscutter=\"$new_gc_repo\" "$HOME/.ElaXan/GCAndroid/repo.json" > "$HOME/.ElaXan/GCAndroid/ZEdit.json"
    rm "$HOME/.ElaXan/GCAndroid/repo.json"
    mv "$HOME/.ElaXan/GCAndroid/ZEdit.json" "$HOME/.ElaXan/GCAndroid/repo.json"
    echo "${GC}Grasscutter repository changed to: $new_gc_repo${WC}"
    echo
    echo -n "Press enter to continue"
    read -r
    GrasscutterRepo
}

ResourcesRepo() {
    credit_hah
    get_current_resources_repo=$(jq -r '.Resources' "$HOME/.ElaXan/GCAndroid/repo.json")
    echo "${CCB}Current Resources repository: ${GC}$get_current_resources_repo${WC}"
    echo
    echo "${YC}Enter b/B to go back to the main menu${WC}"
    echo
    echo -n "Enter new Resources repository: "
    read -r new_resources_repo
    echo
    if [[ "$new_resources_repo" == "b" ]] || [[ "$new_resources_repo" == "B" ]]; then
        settingsMenu
    fi
    if [[ "$new_resources_repo" == "" ]]; then
        echo "${RC}You must enter a repository${WC}"
        echo
        echo -n "Press enter to try again"
        read -r
        ResourcesRepo
    fi
    jq .Resources=\"$new_resources_repo\" "$HOME/.ElaXan/GCAndroid/repo.json" > "$HOME/.ElaXan/GCAndroid/ZEdit.json"
    rm "$HOME/.ElaXan/GCAndroid/repo.json"
    mv "$HOME/.ElaXan/GCAndroid/ZEdit.json" "$HOME/.ElaXan/GCAndroid/repo.json"
    echo "${GC}Resources repository changed to: $new_resources_repo${WC}"
    echo
    echo -n "Press enter to continue"
    read -r
    ResourcesRepo
}

ResetSettingsJSON() {
    credit_hah
    echo "${RC}This will reset the repo.json file to the default settings${WC}"
    echo
    echo -n "Are you sure you want to continue? (y/n): "
    read -r reset_settings_json
    echo
    if [[ "$reset_settings_json" == "y" ]] || [[ "$reset_settings_json" == "Y" ]]; then
        rm "$HOME/.ElaXan/GCAndroid/repo.json"
        echo "{
    \"Grasscutter\": \"https://github.com/Grasscutters/Grasscutter.git\",
    \"Resources\": \"https://gitlab.com/YuukiPS/GC-Resources/-/archive/3.4/GC-Resources-3.4.zip\"
}" > "$HOME/.ElaXan/GCAndroid/repo.json"
        echo "${GC}repo.json file reset to default settings${WC}"
        echo
        echo -n "Press enter to continue"
        read -r
        settingsMenu
    fi
    if [[ "$reset_settings_json" == "n" ]] || [[ "$reset_settings_json" == "N" ]]; then
        settingsMenu
    fi
    if [[ "$reset_settings_json" != "y" ]] || [[ "$reset_settings_json" != "Y" ]] || [[ "$reset_settings_json" != "n" ]] || [[ "$reset_settings_json" != "N" ]]; then
        echo "${RC}You must enter y/Y or n/N${WC}"
        echo
        echo -n "Press enter to try again"
        read -r
        ResetSettingsJSON
    fi
}