#!/bin/bash
usage() { echo "Usage: $0 [-s start ] [ -p stop ] [ -r restart ]" 1>&2; exit 1; }

while getopts ":spr" args; do
  case "${args}" in
    s)
      sudo systemctl start home-assistant@pi.service
      ;;
    p)
      sudo systemctl stop home-assistant@pi.service
      ;;
    r)
      sudo systemctl restart home-assistant@pi.service
      ;;
    *)
      usage
      ;;
  esac
done
