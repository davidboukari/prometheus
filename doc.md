TODO:
INFRA
  mettre LB en static
  mettre les instances sur pushgateway
  
TEST 
* Install prometheus
  add static conf
    * a node which use node_exporter
    * the push gateway service

* Install node_exporter on a node, it export the HARD cpu, disk, ...

* alertmanager   

* Testing prometheus rule: promtool check rules rules_perso/v2/cpu_load.yml

See logs monitoring
  * fluentd

- prometheus 
  prometheus port: 9090
  node-exporter: 9100
  pushgateway: 9091

For all source need go to compil 
  - git@github.com:prometheus/prometheus.git  
  * node_exporter      | git@github.com:prometheus/node_exporter.git  | to compil in go: make build
  * alertmanager       | git@github.com:prometheus/alertmanager.git   | to compil in go: make build
  * pushgateway        | git@github.com:prometheus/pushgateway.git    | ... 
  * consul_exporter    | https://github.com/prometheus/consul_exporter.git
  * graphite_exporter  | git@github.com:prometheus/graphite_exporter.git  

- grafana
  - git@github.com:grafana/grafana.git
  install yarn:  curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
  port: 3000
  username: admin
  password: admin


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




  
