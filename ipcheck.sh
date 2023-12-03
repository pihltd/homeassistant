#!/bin/bash
#Checks the DNS IP address against the WAN IP address and updates DNS with WAN if there's a mismatch
#Allows for multiple domains and external IP check sites, probably won't use though.
#NOTE: This needs the DuckDNS token available as an env variable named DUCKDNS

DOMAINS=( "pihlsecor.duckdns.org" )
IPURL=( "https://ifconfig.me/ip" )

function domainIP () {
  CURRENT_IP=$(dig +short $1)
  #Check that it's an IP address and fail if it isn't
  if [[ $CURRENT_IP =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    echo $CURRENT_IP
  else
    exit 1
  fi
}

function wanIP () {
  WAN_IP=$(curl $1)
  if [[ $WAN_IP =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    echo $WAN_IP
  else
    exit 1
  fi
}

for HOST in "${DOMAINS[@]}"
do
  DOMAIN_IP=$(domainIP $HOST)
  #echo -e "$HOST .. $DOMAIN_IP"

  for URL in "${IPURL[@]}"
  do
    WAN_IP=$(wanIP $URL)
    #echo -e "$URL ..  $WAN_IP"
  done

  if [ "$DOMAIN_IP" = "$WAN_IP" ]; then
    echo "IP Addresses match"
    #echo -e  "https://www.duckdns.org/update?domains=$HOST&token=$DUCKDNS&ip=$WAN_IP"
    #DUCKDNSRESPONSE=$(curl "https://www.duckdns.org/update?domains=$HOST&token=$DUCKDNS&ip=$WAN_IP")
    #echo -e "Response $DUCKDNSRESPONSE"
    exit 0

  elif [ "$DOMAIN_IP" != "$WAN_IP" ]; then
    echo "IP Address mismatch"
    DUCKDNSRESPONSE=$(curl "https://www.duckdns.org/update?domains=$HOST&token=$DUCKDNS&ip=$WAN_IP")
    if $DUCKDNSRESPONSE == 'OK'; then
      exit 0
    else
      exit 1
    fi

    echo -e  "https://www.duckdns.org/update?domains=$HOST&token=$DUCKDNS&ip=$WAN_IP"
  fi
done
