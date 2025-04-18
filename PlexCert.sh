openssl pkcs12 -export \
  -out /home/pihl/plex/certs/plex_cert.p12 \
  -in /home/pihl/.acme.sh/pihlsecor.duckdns.org_ecc/pihlsecor.duckdns.org.cer \
  -certpbe AES-256-CBC -keypbe AES-256-CBC -macalg SHA256 \
  -inkey /home/pihl/.acme.sh/pihlsecor.duckdns.org_ecc/pihlsecor.duckdns.org.key \
  -certfile /home/pihl/.acme.sh/pihlsecor.duckdns.org_ecc/fullchain.cer \
  -passout pass:

chmod 755 /home/pihl/plex/certs/plex_cert.p12
