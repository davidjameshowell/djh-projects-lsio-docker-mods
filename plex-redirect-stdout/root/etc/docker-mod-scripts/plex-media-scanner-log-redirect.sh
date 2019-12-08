#!/usr/bin/with-contenv bash

tail -f  "/config/Library/Application Support/Plex Media Server/Logs/Plex Media Server.log" > /proc/1/fd/1
