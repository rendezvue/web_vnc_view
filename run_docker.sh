#!/bin/bash

ENVS="--env=QT_X11_NO_MITSHM=1
      --env=XAUTHORITY=/root/.Xauthority
      --env=DISPLAY=:9
      --device=/dev/dri:/dev/dri"

         #--volume=/home/$USER/rdv_hermai_ws/data/backup:/root/catkin_ws/src/rdv_amr_3d/data/backup:rw"
XSOCK=/tmp/.X11-unix
XAUTH=$HOME/.Xauthority
VOLUMES="--volume=$XSOCK:$XSOCK:rw
         --volume=$XAUTH:/root/.Xauthority:rw
         --volume=/dev:/dev:ro"


    #--entrypoint /bin/bash \
docker run \
    -d \
    --restart always \
    $ENVS \
    $VOLUMES \
    --privileged \
    -p 5909:5909 \
    --net host \
    --ipc host \
    --gpus all \
    --workdir /root/web_vnc_view \
    --name web_vnc \
    web_vnc:latest

