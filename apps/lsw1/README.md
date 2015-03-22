* start odenos

```
$ ./run-odenos.sh -s
$ ~/trema-edge/trema run -d "./src/main/ruby/org/o3project/odenos/core/odenos.rb --cmpmgr=romgr3"
```

* create components
```
$ ./lsw1.sh
```
or
```
$ ./lsw2.sh
```

* start moniter

```
$ ~/odenos/apps/monitor/monitor -I 192.168.10.104 -f seq_lsw1.yaml
```
or
```
$ ~/odenos/apps/monitor/monitor -I 192.168.10.104 -f seq_lsw2.yaml
```

* start mini_net
```
$ sudo ~/odenos/apps/mininet_examples/single_network_control/start_mininet.py
```

