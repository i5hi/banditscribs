#!/bin/bash -e

#INSTALL 

if [ $# -lt 2 ]
then
 printf "\nWrong Usage: Not enough arguments.\nusage:\n./install.sh os user_for_grpadd \nos must be ubuntu or debian. check about other  os.\nuser_for_grpadd is the name of a user to add to the docker group to allow them to run docker.\n\n"
 exit 1
fi


USER='$2'
OS='$1'

apt update

curl -fsSL https://download.docker.com/linux/$OS/gpg | sudo apt-key add -

apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$OS \
   $(lsb_release -cs) \
   stable"

apt update

apt install docker-ce docker-ce-cli containerd.io

#TEST
docker run hello-world

curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

docker-compose --version


#Create docker group to avoid using sudo

groupadd docker
usermod -aG docker $USER

exit 0
