#!/bin/bash

## Set the signal-science key in /etc/sigsci/agent.conf 
cat <<EOF > /etc/sigsci/agent.conf
accesskeyid = "${ACCESS_KEY_ID}"
secretaccesskey = "${SECRET_ACCESS_KEY}"
EOF


# cat <<EOF > /etc/nginx/nginx.conf
# load_module /usr/share/nginx/modules/ngx_http_sigsci_nxo_module-1.24.0.so; 
# EOF



echo "--------------"

cat /etc/nginx/nginx.conf

echo "--------------"


nginx -t

echo "starting the sigsci-agent..." 

sigsci-agent </dev/null &>/dev/null &


service nginx start


# Keep the container running
tail -f /dev/null
