#!/usr/bin/env bash

# Function to connect and wait for authorization
connect_device() {
    local device_ip="$1"
    local retries=30
    local count=0
    adb connect "$device_ip"
    while true; do
        if [ $count -ge $retries ]; then
            echo "Failed to authorize device $device_ip after $retries attempts."
            return 1
        fi

        # Check the device state
        device_state=$(adb -s "$device_ip" get-state 2>&1)
        if [ "$device_state" = "device" ]; then
            echo "Device $device_ip connected and authorized."
            return 0
        elif [ "$device_state" = "unauthorized" ]; then
            echo "Waiting for device $device_ip to be authorized... (Attempt $((count+1))/$retries)"
        else
            echo "Attempting to connect to device $device_ip... (Attempt $((count+1))/$retries)"
            adb connect "$device_ip" >/dev/null 2>&1
        fi

        sleep 2
        count=$((count+1))
    done
}

# Check if any arguments were provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <device_ip1> [<device_ip2> ...]"
    exit 1
fi

# Iterate over all provided device IPs
for device_ip in "$@"; do
    connect_device "$device_ip"
done

# List all connected devices
echo "Connected devices:"
adb devices -l
