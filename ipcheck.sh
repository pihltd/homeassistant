#!/bin/bash

DOMAINS=( "pihlsecor.duckdns.org" )
IPURL=( "https://ifconfig.me/ip" )

function domainIP () {
  CURRENT_IP=$(dig +short $1)
  echo $CURRENT_IP
  }

function wanIP () {
  getwan=$(curl $1)
  echo $getwan
}

for HOST in "${DOMAINS[@]}"
do
  DOMAIN_IP=$(domainIP $HOST)
  echo -e "$HOST .. $DOMAIN_IP"
done

for URL in "${IPURL[@]}"
do
  WAN_IP=$(wanIP $URL)
  echo -e "$URL ..  $WAN_IP"
done

if [ "$DOMAIN_IP" = "$WAN_IP" ]; then
  echo "IP Addresses match"
fi

if [ "$DOMAIN_IP" != "$WAN_IP" ]; then
  echo "IP Address mismatch"
fi
