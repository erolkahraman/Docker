[root@repos CMD_ENTRYPOINT]# cat Dockerfile_CMD
FROM alpine:latest
CMD ["ping","-c","5","localhost"]

[root@repos CMD_ENTRYPOINT]# cat Dockerfile_ENTRYPOINT
FROM alpine:latest
ENTRYPOINT ["ping"]

[root@repos CMD_ENTRYPOINT]# cat Dockerfile_CMD_EP
FROM alpine:latest
CMD ["-c","5","localhost"]
ENTRYPOINT ["ping"]

========== Entrypoint Değerini Değiştirmek İçin ==========

docker run -it --entrypoint=/bin/bash IMAGE
