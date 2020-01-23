docker run \
        --gpus all \
        --name $(whoami)$(($RANDOM % 101)) \
        --rm \
        -it \
        -w="/home/$(whoami)" \
        -v /mnt/uasisdepo/users/$(whoami):/home/$(whoami) \
        -v /mnt/uasisdepo/:/mnt/uasisdepo:ro \
registry.sea.net:5000/ubuntu18.04_cuda10.0_py3_tf2.0.0_keras_cudnn:v1 /bin/bash