# mount -t nfs 10.1.14.10:/data/Docker/registry /mnt/registry
# mount -t nfs 10.1.14.10:/data/Docker/certs /mnt/certs

docker run -d \
    --restart=always \
    --name registry \
    -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
    -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
    -e DELETE_IMAGES=true \
    -e REGISTRY_STORAGE_DELETE_ENABLED=true \
    -p 5000:5000 \
    -v /mnt/registry:/var/lib/registry \
    -v /mnt/certs:/certs \
registry:2