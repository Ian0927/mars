#!/usr/bin/env bash
certs=/etc/docker/certs.d/172.27.0.49:8443
rm -rf /registry-image
rm -rf /etc/docker/certs
rm -rf $certs

yum -y install sshpass

#for i in {1..3}
#  do
#    sshpass -p vagrant ssh -o StrictHostKeyChecking=no root@172.27.0.49$i rm -rf $certs
#  done

sshpass -p vagrant ssh -o StrictHostKeyChecking=no root@172.27.0.227 rm -rf $certs
sshpass -p vagrant ssh -o StrictHostKeyChecking=no root@172.27.0.228 rm -rf $certs
sshpass -p vagrant ssh -o StrictHostKeyChecking=no root@172.27.0.229 rm -rf $certs

yum remove sshpass -y
docker rm -f registry
docker rmi registry:2
