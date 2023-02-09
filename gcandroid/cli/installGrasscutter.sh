installGrasscutter_cli() {
    # WORKING IN PROGRESS (WIP)
    # this is so fucking messy and i don't know how to make it better
    # may be i can't make this function better
    # ahhhhhh who cares
    if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
        if [ -d "$grasscutter_path" ]; then
            rm -rf "$grasscutter_path"
        fi
    else
        if [ -d "$grasscutter_path" ]; then
            echo "Grasscutter already installed!"
            echo "Use --force or -f to force remove existing grasscutter folder"
            exit 1
        fi
    fi

    # clone grasscutter
    cd $HOME
    git clone $(jq -r .Grasscutter $Path_Repojson) || exit 1
    # check if --force is used then download resources
    if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
        mkdir $HOME/.ElaXan/Download
        cd $HOME/.ElaXan/Download || exit 1
        wget $(jq -r .GrasscutterResources $Path_Repojson) -O GrasscutterResources.zip || exit 1
        unzip GrasscutterResources.zip || exit 1
        rm -rf GrasscutterResources.zip
        if [ -d "$grasscutter_path/resources" ]; then
            rm -rf "$grasscutter_path/resources"
        fi
        mv -f GrasscutterResources/*/* $grasscutter_path/resources
        rm -rf $HOME/.ElaXan/Download
    else
        read -p "Do you want to download Resources? [y/n] " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            mkdir $HOME/.ElaXan/Download
            cd $HOME/.ElaXan/Download || exit 1
            wget $(jq -r .GrasscutterResources $Path_Repojson) -O GrasscutterResources.zip || exit 1
            read -p "Do you want to extract Resources? [y/n] " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                unzip GrasscutterResources.zip || exit 1
                rm -rf GrasscutterResources.zip
                if [ -d "$grasscutter_path/resources" ]; then
                    rm -rf "$grasscutter_path/resources"
                fi
                mv -f GrasscutterResources/*/* $grasscutter_path/resources
                rm -rf $HOME/.ElaXan/Download
            else
                rm -rf GrasscutterResources.zip
                if [ -d "$grasscutter_path/resources" ]; then
                    rm -rf "$grasscutter_path/resources"
                fi
                mv -f GrasscutterResources $grasscutter_path/resources
                rm -rf $HOME/.ElaXan/Download
            fi
        fi
    fi
}