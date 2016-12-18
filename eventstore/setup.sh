#!/bin/bash

#Downloads a docker-compose file from a baseurl

wget -O ./docker-compose.yml "$1/docker-compose-$2.yml"

docker-compose up -d
