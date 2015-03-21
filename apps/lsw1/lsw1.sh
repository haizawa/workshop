#!/bin/sh

## remove proxy
unset http_proxy

FORMAT="\n%{url_effective}, %{response_code}\n\n"
ADDRESS=0.0.0.0

#sleep 1
# view ComponentManagers
curl http://$ADDRESS:10080/systemmanager/component_managers | python -mjson.tool

# create Components
curl -w "$FORMAT" http://$ADDRESS:10080/systemmanager/components/network1 -X PUT -d \
'{"id": "network1", "type": "Network"}'
curl -w "$FORMAT" http://$ADDRESS:10080/systemmanager/components/learning_sw -X PUT -d \
'{"id": "learning_sw", "type": "LearningSwitch"}'
curl -w "$FORMAT" http://$ADDRESS:10080/systemmanager/components/openflow_driver -X PUT -d \
'{"id": "openflow_driver", "type": "OpenFlowDriver"}'

# connect Components
curl -w "$FORMAT" http://$ADDRESS:10080/systemmanager/connections/conn1 -X PUT -d \
'{"id": "conn1", "type": "LogicAndNetwork", "connection_type": "original", "logic_id": "learning_sw", "network_id":"network1"}'
curl -w "$FORMAT" http://$ADDRESS:10080/systemmanager/connections/conn2 -X PUT -d \
'{"id": "conn2", "type": "LogicAndNetwork", "connection_type": "original", "logic_id": "openflow_driver", "network_id":"network1"}'
curl http://$ADDRESS:10080/systemmanager/connections | python -mjson.tool

# view Components
curl http://$ADDRESS:10080/systemmanager/components | python -mjson.tool
