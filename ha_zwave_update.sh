#!/bin/bash
# https://jackstromberg.com/2020/03/how-to-update-home-assistant-docker-container/
# https://jackstromberg.com/2021/03/how-to-upgrade-home-assistant-z-wave-integration-to-z-wave-js-for-docker/
#
#
#  Constant settings, always use these
#
HADOCKERNAME="home-assistant"
ZDOCKERNAME="zwave-js"
ZWAVEDOCKER="zwavejs/zwavejs2mqtt:latest"
HADOCKER="homeassistant/raspberrypi4-homeassistant:stable"
#
# Evans Settings
#
TIMEZONE="America/New_York"
HACONFIGDIR="/home/ubuntu/homeassistantdocker"
ZWAVECONFIGDIR="/home/ubuntu/homeassistantdocker/zwavejsdocker"
#
# Cabin Settings
#
#TIMEZONE="America/Chicago"
#HACONFIGDIR="/home/ubuntur/hadocker"
#ZWAVECONFIGDIR="/home/ubuntu/hadocker/zwave-js"

echo "Stopping ${HADOCKERNAME}"
docker stop ${HADOCKERNAME}

echo "Removing ${HADOCKERNAME}"
docker rm ${HADOCKERNAME}

echo "Stopping ${ZDOCKERNAME}"
docker stop ${ZDOCKERNAME}

echo "Removing ${ZDOCKERNAME}"
docker rm ${ZDOCKERNAME}

echo "Pulling new ${HADOCKERNAME}"
docker pull ${HADOCKER}

echo "Pulling new ${ZDOCKERNAME}"
docker pull ${ZWAVEDOCKER}

echo "Starting ${ZDOCKERNAME}"
docker run -d --restart=always  -p 8091:8091 -p 3000:3000 --device=/dev/ttyACM0 --name="${DOCKERNAME}" -e "${TIMEZONE}" -v ${ZWAVEDIR}:/usr/src/app/store zwavejs/zwavejs2mqtt:latest

echo "Starting ${HADOCKERNAME}"
docker run --init -d --restart=always --name="${DOCKERNAME}" -e "${TIMEZONE}" -v ${CONFIGDIR}:/config --net=host homeassistant/raspberrypi4-homeassistant:stable
