#!/usr/bin/env bash

echo "Welcome to the ADB Server restricted shell. Only 'adb' commands are allowed."

while true; do
    read -p "# " cmd args
    if [[ $cmd == "adb" && $args == "connect"* ]]; then
        /usr/local/bin/adb_connect.sh ${args#connect }
    elif [[ $cmd == "adb" ]]; then
        adb $args
    elif [[ $cmd == "exit" || $cmd == "quit" ]]; then
        echo "Exiting restricted shell."
        exit 0
    else
        echo "Only 'adb' commands are allowed."
    fi
done
