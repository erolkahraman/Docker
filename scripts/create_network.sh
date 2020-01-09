#!/bin/bash

docker network create \
  --driver=bridge \
  --subnet=172.18.0.0/24 \
  --ip-range=172.18.0.0/24 \
  --gateway=172.18.0.1 \
  --label="net.name=UASIS_NET" \
  --label="net.type=public" \
UASIS_NET
