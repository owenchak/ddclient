#!/usr/bin/env bash

cat << EOF > /etc/ddclient/ddclient.conf
##
### CloudFlare config
###

ssl=yes
use=web, web=dyndns
protocol=cloudflare,
server=api.cloudflare.com/client/v4
login=$LOGIN
password=$PASSWORD

# set domain and subdomain to update
zone=$ZONE_DOMAIN
$ZONE_HOSTNAME
EOF

ddclient -daemon=0 -debug -verbose -noquiet
