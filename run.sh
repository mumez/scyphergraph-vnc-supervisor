#!/bin/bash

docker build -t my_scyphergraph .
docker run --name my_scyphergraph01 -v /Users/ume/git/scyphergraph-pharo-vnc-supervisor:/root/temp -d -p 5900:5900 -p 6901:6901 my_scyphergraph
