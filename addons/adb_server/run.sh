#!/usr/bin/env bash
set -e

# Setup persistent ADB keys
if [ ! -d /config/.android ]; then
  mkdir -p /config/.android
fi
ln -sf /config/.android /root/.android

# Get the configured ADB port
ADB_PORT=${ADB_PORT:-5037}

# Ensure platform-tools are on PATH at runtime (in case ENV didn't propagate)
export PATH="/opt/platform-tools:${PATH}"

# Start ADB server
adb -a -P "${ADB_PORT}" start-server
echo "ADB server started on port ${ADB_PORT}"

# Auto-connect to configured devices
if [ -n "${AUTO_CONNECT_DEVICES}" ]; then
    IFS=',' read -r -a devices <<< "${AUTO_CONNECT_DEVICES}"
    echo "Attempting to connect to configured devices"
    /usr/local/bin/adb_connect.sh "${devices[@]}"
else
    echo "No devices configured for auto-connect"
fi

# List connected devices
echo "Connected devices:"
adb devices -l

# Start ttyd with writable mode and restricted shell
ttyd -p 7681 --writable /usr/local/bin/restricted-shell.sh &

# Keep the add-on running
tail -f /dev/null
