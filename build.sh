#!/bin/bash

docker build -t dmr/blue:0 -f Dockerfile.blue .
docker build -t dmr/green:0 -f Dockerfile.green .

docker tag dmr/blue:0 localhost:5000/blue
docker tag dmr/green:0 localhost:5000/green

docker push localhost:5000/blue
docker push localhost:5000/green
