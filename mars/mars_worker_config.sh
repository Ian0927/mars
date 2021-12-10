#!/usr/bin/env bash

#only worker node
kubeadm join --token 123456.1234567890123456 --discovery-token-unsafe-skip-ca-verification 172.27.0.49:6443
