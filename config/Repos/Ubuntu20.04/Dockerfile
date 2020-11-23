FROM ubuntu:20.04

RUN apt update -y && apt upgrade -y && apt install apt-mirror -y
#RUN sed -i 's/# set base_path/set base_path/' /etc/apt/mirror.list
#RUN sed -i 's/^deb-src/# deb-src/g' /etc/apt/mirror.list
ENTRYPOINT ["apt-mirror"]
