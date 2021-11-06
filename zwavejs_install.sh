#!/bin/bash
# updates zwavejs container
#
# https://jackstromberg.com/2021/03/how-to-upgrade-home-assistant-z-wave-integration-to-z-wave-js-for-docker/

DOCKERNAME="zwave-js"
TIMEZONE="America/New_York"
PULLTHIS="zwavejs/zwavejs2mqtt:latest"
ZWAVEDIR="/home/ubuntu/homeassistantdocker/zwavejsdocker"

#docker stop ${DOCKERNAME}

#docker rm ${DOCKERNAME}

#docker pull ${PULLTHIS}

#docker run -d --restart=always  -p 8091:8091 -p 3000:3000 --device=/dev/ttyACM0 --name="${DOCKERNAME}" -e "${TIMEZONE}" -v /home/docker/zwave-js:/usr/src/app/store zwavejs/zwavejs2mqtt:latest
docker run -d --restart=always  -p 8091:8091 -p 3000:3000 --device=/dev/ttyACM0 --name="${DOCKERNAME}" -e "${TIMEZONE}" -v ${ZWAVEDIR}:/usr/src/app/store zwavejs/zwavejs2mqtt:latest
