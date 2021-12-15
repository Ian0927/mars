#!/usr/bin/env bash

####################################################
# mars-master1 서버의 IP는 내용과 일치 시킬 것
# mars_master_config 
# --apiserver-advertise-address
# mars_worker_config
# --discovery-token-unsafe-skip-ca-verification
####################################################
echo "172.27.0.49 mars-master1" >> /etc/hosts
echo "172.27.0.192 mars-worker1" >> /etc/hosts
echo "172.27.0.175 mars-worker2" >> /etc/hosts
echo "172.27.0.105 mars-worker3" >> /etc/hosts
