#!/usr/bin/env bash

#only master node
kubeadm init --token 123456.1234567890123456 --token-ttl 0 \
--pod-network-cidr=172.27.0.0/16 --apiserver-advertise-address=172.27.0.49

mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://raw.githubusercontent.com/Ian0927/mars/master/mars/172.27_net_calico.yaml
