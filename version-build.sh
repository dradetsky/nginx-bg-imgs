#!/bin/bash

if [ $# -eq 0 ] ; then
    echo 'needs arg'
    exit
fi

version=$1

cleanup() {
    rm -f index.html
}
trap cleanup INT KILL EXIT


cat version.html | sed "s/version/$version/" > index.html

docker build -t dmr/bgv:$version -f Dockerfile.version .
docker tag dmr/bgv:$version localhost:5000/bgv:$version
docker push localhost:5000/bgv:$version

cleanup
