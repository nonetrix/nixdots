{ pkgs, ... }:

let
  tedit = pkgs.writeShellScriptBin "tedit" ''
    #!/bin/bash

    # Check if a file argument is provided
    if [ $# -eq 0 ]; then
        echo "Usage: $0 <file>"
        exit 1
    fi

    file=$1

    # Check if the file can be written to by the current user
    if [ -w "$file" ]; then
        $EDITOR "$file"
    elif [ -h "$file" ]; then
        # If it's a symbolic link, find the target file and edit that
        target=$(readlink -e "$file")
        if [ -n "$target" ] && [ -w "$target" ]; then
            $EDITOR "$target"
        else
            echo "Cannot determine the target file or the target file is not writable."
            exit 1
        fi
    else
        # Prompt the user to open as root
        read -p "This file cannot be written to as the current user. Would you like to open it as root (Y/n): " choice
        if [ "$choice" == "Y" ] || [ "$choice" == "y" ]; then
            sudo -e "$file"
        else
            echo "Exiting without editing the file."
            exit 0
        fi
    fi
  '';

in {
  environment.systemPackages = [ tedit ];
}
