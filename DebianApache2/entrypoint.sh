#!/bin/bash

cat <<EOF > /etc/sigsci/agent.conf

accesskeyid = "${ACCESS_KEY_ID}"
secretaccesskey = "${SECRET_ACCESS_KEY}"

EOF

apt-get install sigsci-module-apache

a2enmod signalsciences

service apache2 restart

sigsci-agent </dev/null &>/dev/null &

# Optionally start the sigsci-agent service if it should run as the main process

# Keep the container running
exec "$@"


# Keep the container running

