FROM centos:8

RUN dnf install yum-utils -y
# RUN mkdir -p /etc/scripts/

# ADD repo_sync.sh /etc/scripts/ 

ENTRYPOINT ["sh","/etc/scripts/repo_sync.sh"]
