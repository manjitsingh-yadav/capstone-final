#!/bin/bash
sudo ETCDCTL_API=3 etcdctl --endpoints 127.0.0.1:2379 --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key --cacert=/etc/kubernetes/pki/etcd/ca.crt snapshot save /tmp/snapshot-db-$(date +%d-%m-%y-%H-%M)
