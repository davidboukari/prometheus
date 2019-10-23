#!/bin/bash

PROMETHEUS_ROOTDIR=/home/vagrant/git/monitoring/prometheus
GRAFANA_ROOTDIR=/home/vagrant/git/monitoring/grafana
CONSUL_ROOTDIR=/home/vagrant/git/monitoring/consul
CONSUL_SERVER=192.168.85.10
CONSUL_BIND_ADDR=0.0.0.0


${CONSUL_ROOTDIR}/consul agent -bind ${CONSUL_SERVER} -config-dir=${CONSUL_ROOTDIR}/conf.d -data-dir=${CONSUL_ROOTDIR}/data_dir -client ${CONSUL_BIND_ADDR} -server -bootstrap -ui &

${PROMETHEUS_ROOTDIR}/alertmanager/alertmanager 		--config.file="${PROMETHEUS_ROOTDIR}/alertmanager/alertmanager.yml" &
${PROMETHEUS_ROOTDIR}/blackbox_exporter/blackbox_exporter 	--config.file="${PROMETHEUS_ROOTDIR}/blackbox_exporter/blackbox.yml" &
${PROMETHEUS_ROOTDIR}/pushgateway/pushgateway	 &
${PROMETHEUS_ROOTDIR}/prometheus/prometheus		--config.file="${PROMETHEUS_ROOTDIR}/prometheus/prometheus.yml" &

${GRAFANA_ROOTDIR}/grafana/bin/grafana-server  -homepath "${GRAFANA_ROOTDIR}/grafana"  &
