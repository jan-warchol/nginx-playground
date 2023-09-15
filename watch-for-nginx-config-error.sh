#!/bin/bash

# Run this script on the host (not inside vagrant) to get notifications
flag_path="./configs/nginx configuration error!";

while true; do
    sleep 5;
    [ -e "$flag_path" ] && notify-send "Nginx configuration error!"
done
