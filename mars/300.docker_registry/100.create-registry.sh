#!/usr/bin/env bash
certs=/etc/docker/certs.d/172.27.0.49:8443
mkdir /registry-image
mkdir /etc/docker/certs
mkdir -p $certs
openssl req -x509 -config $(dirname "$0")/tls.csr -nodes -newkey rsa:4096 \
-keyout tls.key -out tls.crt -days 365 -extensions v3_req

yum install sshpass -y

#for i in {1..3}
#  do
#    sshpass -p vagrant ssh -o StrictHostKeyChecking=no root@172.27.0.49$i mkdir -p $certs
#    sshpass -p vagrant scp tls.crt 172.27.0.49$i:$certs
#  done

sshpass -p rhkwp12#$ ssh -o StrictHostKeyChecking=no root@172.27.0.227 mkdir -p $certs
sshpass -p rhkwp12#$ scp tls.crt 172.27.0.227:$certs

sshpass -p rhkwp12#$ ssh -o StrictHostKeyChecking=no root@172.27.0.228 mkdir -p $certs
sshpass -p rhkwp12#$ scp tls.crt 172.27.0.228:$certs

sshpass -p rhkwp12#$ ssh -o StrictHostKeyChecking=no root@172.27.0.229 mkdir -p $certs
sshpass -p rhkwp12#$ scp tls.crt 172.27.0.229:$certs

cp tls.crt $certs
mv tls.* /etc/docker/certs

docker run -d \
  --restart=always \
  --name registry \
  -v /etc/docker/certs:/docker-in-certs:ro \
  -v /registry-image:/var/lib/registry \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/docker-in-certs/tls.crt \
  -e REGISTRY_HTTP_TLS_KEY=/docker-in-certs/tls.key \
  -p 8443:443 \
  registry:2
