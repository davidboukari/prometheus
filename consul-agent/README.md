### On a node_exporter ###
$ ./node_exporter

create  conf.d/node_exporter.json
{
 "service": {
   "name": "node_exporter",
   "tags": ["monitor"],
   "port": 9100
 }
}

Start consul agent 
./consul agent -bind 192.168.85.30   -config-dir=$PWD/conf.d  -data-dir=$PWD/data_dir -join 192.168.85.10

### On the prometheus server ###

Start consul agent server:
./consul agent -bind 192.168.85.10 -config-dir=$PWD/conf.d -data-dir=$PWD/data_dir -client 0.0.0.0 -server -bootstrap -ui

Add the consul in prometheus.yml
scrape_configs:
...
 - job_name: consul
    consul_sd_configs:
      - server: 'localhost:8500'
    relabel_configs:
      - source_labels: [__meta_consul_tags]
        regex: .*,monitor,.*
        action: keep
      - source_labels: [__meta_consul_service]
        target_label: service

Start the prometheus server:
./prometheus --config.file=prometheus.yml

Go to the web ui: http://192.168.85.10:8500
