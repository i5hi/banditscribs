#!/bin/bash

# Generate free, CA signed SSL Certificates
# Buy a domain name at namecheap.com
# Secure your domain name with cloudflare.com

if [ $# -lt 1 ]
then
 printf "\nWrong Usage: Not enough arguments.\nusage:\n./generate_ssl_certs.sh url \nRegister and host a domain name (via namecheap/cloudflare) to resolve to this server's IP and use this name as <url> example.sats.cc\n\n\n"
 exit 1
fi

URL=$1

sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt

sudo mkdir /etc/letsencrypt/live

cd /opt/letsencrypt

echo "Creating certificates for $URL"

sudo -H ./letsencrypt-auto certonly --standalone -d $URL

echo "The following sites have authorized letsencrypt ssl certificates"
sudo ls /etc/letsencrypt/live

exit 0;