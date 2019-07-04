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
$ZONE_HOSTNAME_1
$ZONE_HOSTNAME_2
$ZONE_HOSTNAME_3
$ZONE_HOSTNAME_4
$ZONE_HOSTNAME_5
$ZONE_HOSTNAME_6
$ZONE_HOSTNAME_7
$ZONE_HOSTNAME_8
$ZONE_HOSTNAME_9
$ZONE_HOSTNAME_10
EOF

ddclient -daemon=0 -debug -verbose -noquiet
