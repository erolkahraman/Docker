FROM centos:7

RUN yum install yum-utils createrepo -y
# RUN mkdir -p /etc/scripts/

# ADD repo_sync.sh /etc/scripts/ 

ENTRYPOINT ["sh","/etc/scripts/repo_sync.sh"]
