#!/bin/bash

COLLECTION="possum"
IMAGE="opencadc/${COLLECTION}2caom2"

echo "Get a proxy certificate"
cp $HOME/.ssl/cadcproxy.pem ./ || exit $?

echo "Get image ${IMAGE}"
docker pull ${IMAGE}

echo "Run image ${IMAGE}"
docker run --rm --name ${COLLECTION}_remote  --user $(id -u):$(id -g) -e HOME=/usr/src/app -v ${PWD}:/usr/src/app/ -v ${PWD}/data:/data ${IMAGE} ${COLLECTION}_run_remote || exit $?

date
exit 0
