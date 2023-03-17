#!/bin/bash

# Uses the current working directory.
# Run this script by typing the full location or add the folder it is in to your PATH

skipConfirmation="no"

if [ $skipConfirmation == "no" ]; then

    echo "zip archives will be created for the following folders/files:"
    echo ""

    for f in *; do
        echo $f;
    done

    echo ""
    read -p "Is this okay? (y/n): " confirm

    if [ $confirm != "y" ]; then
        exit
    fi

fi

for f in *; do
    zip -r $f.zip $f;
done
