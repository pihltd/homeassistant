#!/bin/bash
#
# Command to install a new home assistant docker image and connect to the right dirs
#
# https://jackstromberg.com/2020/03/how-to-update-home-assistant-docker-container/
#
DOCKERNAME="home-assistant"
TIMEZONE="America/New_York"
CONFIGDIR="/home/ubuntu/homeassistantdocker"
HADOCKER="homeassistant/raspberrypi4-homeassistant:stable"

#docker stop ${DOCKERNAME}

#docker rm ${DOCKERNAME:

#docker pull ${HADOCKER}

#echo docker run --init -d --restart=always --name="${DOCKERNAME}" -e "${TIMEZONE}" -v ${CONFIGDIR}:/config --net=host homeassistant/raspberrypi4-homeassistant:stable
docker run --init -d --restart=always --name="${DOCKERNAME}" -e "${TIMEZONE}" -v ${CONFIGDIR}:/config --net=host homeassistant/raspberrypi4-homeassistant:stable
