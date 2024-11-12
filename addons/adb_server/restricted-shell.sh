#!/usr/bin/env bash

echo "Welcome to the ADB Server restricted shell. Only 'adb', 'wget', and 'curl' commands are allowed."

while true; do
    # Use read -ra to properly split cmd and args into an array
    read -r -p "# " -a input

    cmd="${input[0]}"
    args=("${input[@]:1}")

    if [[ "$cmd" == "adb" && "${args[0]}" == "connect" ]]; then
        # Handle adb connect command separately
        /usr/local/bin/adb_connect.sh "${args[@]:1}"
    elif [[ "$cmd" == "adb" ]]; then
        # Pass all arguments to adb safely
        adb "${args[@]}"
    elif [[ "$cmd" == "curl" || "$cmd" == "wget" ]]; then
        if [[ "${args[-1]}" == *.apk ]]; then
            # Allow only .apk file downloads
            "$cmd" "${args[@]}"
        else
            echo "Only .apk files are allowed"
        fi
    elif [[ "$cmd" == "exit" || "$cmd" == "quit" ]]; then
        echo "Exiting restricted shell."
        exit 0
    else
        echo "Only 'adb', 'wget', and 'curl' commands are allowed."
    fi
done
