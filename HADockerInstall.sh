#! /bin/bash
docker run -d \
--name homeassistant \
--privileged \
--restart=unless-stopped \
-e TZ=America/New_York \
-v /home/pihl/homeassistant:/config \
-v /run/dbus:/run/dbus:ro \
--network=host \
ghcr.io/home-assistant/home-assistant:stable
