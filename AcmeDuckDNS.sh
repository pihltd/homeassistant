#!/bin/bash
export DuckDNS_Token=<TOKEN HERE>
/home/pihl/.acme.sh/acme.sh --issue --force --dns dns_duckdns -d 'pihlsecor.duckdns.org' --dnssleep 120 --days 90 --ecc --server https://acme-v02.api.letsencrypt.org/directory
