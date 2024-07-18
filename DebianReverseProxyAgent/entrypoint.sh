#!/bin/bash

cat <<EOF > /etc/sigsci/agent.conf

accesskeyid = "${ACCESS_KEY_ID}"
secretaccesskey = "${SECRET_ACCESS_KEY}"

# Reverse proxy

[revproxy-listener.myNodeJSApp]
listener = "http://0.0.0.0:80"
upstreams = "http://127.0.0.1:3082"

EOF


sigsci-agent </dev/null &>/dev/null &

cd /var/www/html && npm install && node app.js

# Optionally start the sigsci-agent service if it should run as the main process


# Keep the container running
exec "$@"
