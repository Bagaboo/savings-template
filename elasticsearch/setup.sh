#!/bin/bash

#Set map count
#run with argument 0,1,2 etc... to set the ip of the server
sysctl -w vm.max_map_count=262144

#copy the correct elasticsearch config
mkdir esdata
mkdir esconfig
chmod 777 esdata

url="$1/elasticsearch.yml"

wget -O ./esconfig/elasticsearch.yml $url

echo "network.publish_host: $2" >> ./esconfig/elasticsearch.yml
echo "discovery.zen.ping.unicast.hosts: 10.0.1.10, 10.0.1.11, 10.0.1.12" >> ./esconfig/elasticsearch.yml

wget -O ./docker-compose.yml "$1/docker-compose.yml"

docker-compose up -d

#to download me run wget -O ./setup-server.sh "https://raw.githubusercontent.com/iremmats/savings-elastic/master/elasticsearch/setup.sh"