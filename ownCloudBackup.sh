#!/bin/bash
#Backup owncloud mysql and delete the oldest file if more than the specified number
KEEPFILENUM=5
TARGETDIR="/mnt/bigbackup/owncloudbackup/"
CONFIGDIR="/var/www/owncloud/config/"
CONFIGTARGETDIR="${TARGETDIR}config"
TODAY=$(date +"%Y-%m-%d")

#Run the mysqldump
echo "Running mysqldump"
mysqldump --single-transaction -h localhost -u root owncloud > ${TARGETDIR}OwncloudBackup_${TODAY}.sql

#Rsync the config directory
echo "Rsync the owncloud config directory"
rsync -Aax ${CONFIGDIR} ${CONFIGTARGETDIR}

#Remove old backup files
echo "Removing any old backup files"
ls -1td ${TARGETDIR}/* | tail -n +${KEEPFILENUM} |  xargs rm
