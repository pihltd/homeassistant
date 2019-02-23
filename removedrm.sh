#!/bin/bash

usage() { echo "Usage: $0 [-s <STARTDIR>] [-t <TARGETDIR>]" 1>&2; exit 1; }

while getopts ":s:t:" opt; do
  case ${opt} in
    s)
      STARTDIR=${OPTARG}
      ;;
    t)
      TARGETDIR=${OPTARG}
      ;;
    *)
      usage
      ;;
  esac
done

#Test if the start directory exists and blow up if not
if [ ! -d "${STARTDIR}" ]; then
  echo "Invalid starting directory" 1>&2; exit 1;
fi

#Test if the target exists and create if not
if [ ! -d "${TARGETDIR}" ]; then
  mkdir -p "${TARGETDIR}"
fi

#Run DeDRM on each file
for filename in "${STARTDIR}"; do
  python /home/pi/bin/
