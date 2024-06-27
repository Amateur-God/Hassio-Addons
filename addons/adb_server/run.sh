#!/usr/bin/with-contenv bashio
set -e

# Setup persistent ADB keys
if [ ! -d /config/.android ]; then
  mkdir -p /config/.android
fi
ln -sf /config/.android /root/.android

# Get the configured ADB port
ADB_PORT=$(bashio::config 'adb_port')

# Start ADB server
adb -a -P ${ADB_PORT} start-server
bashio::log.info "ADB server started on port ${ADB_PORT}"

# Auto-connect to configured devices
if bashio::config.has_value 'auto_connect_devices'; then
    devices=$(bashio::config 'auto_connect_devices')
    bashio::log.info "Attempting to connect to configured devices"
    /usr/local/bin/adb_connect.sh "${devices[@]}"
else
    bashio::log.info "No devices configured for auto-connect"
fi

# List connected devices
bashio::log.info "Connected devices:"
adb devices -l

# Start ttyd with restricted shell
ttyd -p 7681 /usr/local/bin/restricted-shell.sh &

# Keep the add-on running
tail -f /dev/null
