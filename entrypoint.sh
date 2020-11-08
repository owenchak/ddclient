#!/usr/bin/env bash

cat << EOF > /etc/ddclient/ddclient.conf
##
### Namecheap config
###

ssl=yes
use=web, web=dnamicdns.park-your-name.com/getip
protocol=namecheap
server=dynamicdns.park-your-domain.com
login=yourdomain.com
password=$PASSWORD
@
EOF

ddclient -daemon=0 -debug -verbose -noquiet
