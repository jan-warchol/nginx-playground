#!/bin/bash

# Run this script on the host where nginx is running (e.g. inside vagrant)

flag_path="$(dirname $0)/configs/nginx configuration error!";

while true; do
    sleep 1;

    rm -f "$flag_path";
    if sudo systemctl reload nginx.service; then
        echo reload successful;
    else
        sudo systemctl status nginx.service > "$flag_path";
    fi
done
