#! /bin/sh

# /root/.acme.sh/acme.sh --issue --standalone -d computemachines.com -k 4096
# mkdir -pv /etc/ssl/acme/computemachines.com/
# /root/.acme.sh/acme.sh --installcert -d computemachines.com \
# 		       --keypath /etc/ssl/acme/computemachines.com/privkey.key --fullchainpath /etc/ssl/acme/computemachines.com/fullchain.cer
nginx -g 'daemon off;'
