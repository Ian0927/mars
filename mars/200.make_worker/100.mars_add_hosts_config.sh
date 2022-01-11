#!/usr/bin/env bash

####################################################
# mars-master1 서버의 IP는 내용과 일치 시킬 것
# mars_master_config 
# --apiserver-advertise-address
# mars_worker_config
# --discovery-token-unsafe-skip-ca-verification
####################################################
echo "172.27.0.49 mars-master1" >> /etc/hosts
echo "172.27.0.227 mars-worker1" >> /etc/hosts
echo "172.27.0.228 mars-worker201" >> /etc/hosts
echo "172.27.0.229 mars-worker202" >> /etc/hosts
echo "172.27.0.88 mars-worker203" >> /etc/hosts
echo "172.27.0.27 mars-worker204" >> /etc/hosts
