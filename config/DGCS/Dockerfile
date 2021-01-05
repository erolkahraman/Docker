FROM ubuntu:18.04 as base

LABEL maintainer "Erol KAHRAMAN <erol.kahraman@tubitak.gov.tr>"

##############################################
## Python3

RUN apt-get update && apt-get install -y \
    python3 python3-dev python3-pip python3-venv \
    && rm -rf /var/lib/apt/lists/*