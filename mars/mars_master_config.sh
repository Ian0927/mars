#!/usr/bin/env bash

#common(master, worker) node
echo 'alias vi=vim' >> /etc/profile

swapoff -a

sed -i.bak -r 's/(.+ swap .+)/#\1/' /etc/fstab

gg_pkg="packages.cloud.google.com/yum/doc" # Due to shorten addr for key
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://${gg_pkg}/yum-key.gpg https://${gg_pkg}/rpm-package-key.gpg
EOF

setenforce 0

sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

modprobe br_netfilter

cat <<EOF > /etc/resolv.conf
nameserver 1.1.1.1 #cloudflare DNS
nameserver 8.8.8.8 #Google DNS
EOF

yum install epel-release -y
yum install vim-enhanced -y
yum install git -y

yum install docker -y && systemctl enable --now docker

yum install kubelet-1.18.4 kubeadm-1.18.4 -y
systemctl enable --now kubelet

#only master node
kubeadm init --token 123456.1234567890123456 --token-ttl 0 \
--pod-network-cidr=172.27.0.0/16 --apiserver-advertise-address=172.27.0.49

mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://github.com/Ian0927/mars/blob/master/mars/172.27_net_calico.yaml
