Update_Grasscutter() {
    credit_hah
    echo "${GC}Updating Grasscutter${WC}"
    if [[ ! -d $grasscutter_path/.git ]]; then
        echo "${RC}.git folder not found, can't update Grasscutter${WC}"
        echo
        echo -n "Press enter for back to Menu"
        read
        main_menu
    fi
    # Check if git is installed
    if ! command -v git &>/dev/null; then
        Run "apt install git -y" "Installing git command" "0" "main_menu" "Main Menu"
    fi
    # Run git pull and get the output
    # if already up to date then return
    git_pull_output=$(git -C $grasscutter_path pull 2>&1)
    if [[ $git_pull_output == *"Already up to date"* ]]; then
        echo "${GC}Grasscutter is already up to date${WC}"
        echo
        echo -n "Press enter for back to Menu"
        read
        main_menu
    else
        echo "${GC}Grasscutter is updated${WC}"
        echo "Output : $git_pull_output"
        echo
        echo -n "Press enter for back to Menu"
        read
        main_menu
    fi
    # if failed to update then return
    if [[ $git_pull_output == *"error"* ]]; then
        echo "${RC}Failed to update Grasscutter${WC}"
        echo
        echo -n "Press enter for back to Menu"
        read
        main_menu
    fi
}