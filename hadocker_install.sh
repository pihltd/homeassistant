#!/bin/bash
#https://peyanski.com/home-assistant-supervised-and-container-how-to/
#
#Install and initialize HA docker container.  Not for updating

DOCKERNAME="home-assistant"
TIMEZONE="America/New_York"
HADOCKER="homeassistant/raspberrypi4-homeassistant:stable"

#Evans Street
#CONFIGDIR="/home/ubuntu/homeassistantdocker"

#Cabin
CONFIGDIR="/home/ubuntu/hadocker"

echo docker run --init -d --restart=unless-stopped --name="${DOCKERNAME}" -e "TZ=${TIMEZONE}" -v ${CONFIGDIR}:/config -p 8123:8123 ${HADOCKER}