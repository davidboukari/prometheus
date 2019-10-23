#!/bin/bash

PROMETHEUS_ROOTDIR=/home/vagrant/git/prometheus
CONSUL_ROOTDIR=/home/vagrant/git/consul
CONSUL_SERVER=192.168.85.10
CONSUL_BIND_ADDR=0.0.0.0
CONSUL_NODE_IP=`ip a |grep 'inet '|tail -1|awk '{print $2}'|sed "s?/.*??g"`


${CONSUL_ROOTDIR}/consul agent -bind ${CONSUL_NODE_IP} -config-dir=${CONSUL_ROOTDIR}/conf.d  -data-dir=${CONSUL_ROOTDIR}/data_dir -join ${CONSUL_SERVER} &

${PROMETHEUS_ROOTDIR}/node_exporter-0.18.1.linux-amd64/node_exporter  &
