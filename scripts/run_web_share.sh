mount -t nfs 10.1.14.10:/data/share /mnt/share

docker container run \
        -d \
        -p 80:80 \
        --mount type=bind,source=/mnt/share/uasis/conf.d,destination=/etc/nginx/conf.d,readonly \
        --mount type=bind,source=/mnt/share/uasis,destination=/uasis,readonly \
        --mount type=bind,source=/mnt/share/diger,destination=/diger,readonly \
        --name web_share01 \
nginx:latest