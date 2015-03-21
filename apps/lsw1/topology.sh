#!/bin/sh

## remove proxy
unset http_proxy

FORMAT="\n%{url_effective}, %{response_code}\n\n"
ADDRESS=0.0.0.0

#sleep 1
curl http://$ADDRESS:10080/systemmanager/component_managers | python -mjson.tool
curl http://$ADDRESS:10080/systemmanager/components | python -mjson.tool
# view topologys
echo "### network0 ###"
curl http://$ADDRESS:10080/network0/topology | python -mjson.tool
echo "### network1 ###"
curl http://$ADDRESS:10080/network1/topology | python -mjson.tool

# view flows
echo "### network0 ###"
curl http://$ADDRESS:10080/network0/flows | python -mjson.tool
echo "### network1 ###"
curl http://$ADDRESS:10080/network1/flows | python -mjson.tool
