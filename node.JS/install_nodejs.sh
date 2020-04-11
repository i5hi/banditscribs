#!/bin/bash

bash ../system/get_debian_basics.sh

if [ $# -lt 1 ]
then
 printf "\nWrong Usage: Not enough arguments.\nusage:\n./install_nodejs.sh version_number \nTry 13 as version_number as of Fri, 03 Apr 2020 22:25:26 GMT\n\n\n"
 exit 1
fi

curl -sL https://deb.nodesource.com/setup_"$1".x | sudo -E bash -

printf "\n!!!Requiring root permission to install node.js\n\n"
sudo apt-get install -y nodejs

exit 0
