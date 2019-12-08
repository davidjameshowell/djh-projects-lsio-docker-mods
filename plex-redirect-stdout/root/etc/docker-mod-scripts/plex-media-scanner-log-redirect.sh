#!/usr/bin/with-contenv bash

bash -c 'tail -f  "/config/Library/Application Support/Plex Media Server/Logs/Plex Media Server.log" | grep --line-buffered .  > /proc/1/fd/1'
