
See logs monitoring
  * fluentd

- prometheus
  * node_exporter
  * alertmanager
  * pushgateway
  * consul_exporter 

for node_exporter install go here: https://golang.org/dl/

- grafana

KEY=~/.ssh/id_rsa-github  git  clone git@github.com:davidboukari/ansible-roles.git

# Start prometheus
./prometheus --config.file=prometheus.yml

# Node Exporter
Building:
    go get github.com/prometheus/node_exporter
    cd ${GOPATH-$HOME/go}/src/github.com/prometheus/node_exporter
    make
    ./node_exporter <flags>
    ./node_exporter -h
    make test




  
