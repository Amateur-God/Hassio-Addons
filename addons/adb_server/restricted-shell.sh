#!/usr/bin/env bash

echo "Welcome to the ADB Server restricted shell. Only 'adb' commands are allowed."

while true; do
    # Use read -r to avoid mangling backslashes
    read -r -p "# " cmd args

    if [[ "$cmd" == "adb" && "$args" == "connect"* ]]; then
        # Double quote to prevent globbing and word splitting
        /usr/local/bin/adb_connect.sh "${args#connect }"
    elif [[ "$cmd" == "adb" ]]; then
        # Double quote to prevent globbing and word splitting
        adb "$args"
    elif [[ "$cmd" == "exit" || "$cmd" == "quit" ]]; then
        echo "Exiting restricted shell."
        exit 0
    else
        echo "Only 'adb' commands are allowed."
    fi
done
