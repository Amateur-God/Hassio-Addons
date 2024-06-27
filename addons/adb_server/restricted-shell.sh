#!/usr/bin/with-contenv bashio

bashio::log.info "Welcome to the ADB Server restricted shell. Only 'adb' commands are allowed."

while true; do
    read -p "# " cmd args
    if [[ $cmd == "adb" && $args == "connect"* ]]; then
        /usr/local/bin/adb_connect.sh ${args#connect }
    elif [[ $cmd == "adb" ]]; then
        adb $args
    elif [[ $cmd == "exit" || $cmd == "quit" ]]; then
        bashio::log.info "Exiting restricted shell."
        exit 0
    else
        bashio::log.warning "Only 'adb' commands are allowed."
    fi
done
