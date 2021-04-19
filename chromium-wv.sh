#!/usr/bin/env bash

echo "Enabling XHost Forwarding..."
xhost +

echo "Setting Up User Volume..."
docker volume create chromium_home

echo "Running Docker container..."
docker run --privileged \
        -e DISPLAY=unix$DISPLAY \
        -v chromium_home:/home \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /dev:/dev -v /run:/run \
        -v /etc/machine-id:/etc/machine-id \
        --ipc=host \
               parandandrd/chromium-wv:slim
