#!/bin/bash

ENVS="--env=QT_X11_NO_MITSHM=1
      --env=XAUTHORITY=/root/.Xauthority
      --env=DISPLAY=:9
      --device=/dev/dri:/dev/dri"

XSOCK=/tmp/.X11-unix
XAUTH=/root/.Xauthority
VOLUMES="--volume=$XSOCK:$XSOCK:rw
         --volume=$XAUTH:/root/.Xauthority:rw
         --volume=/dev:/dev:ro
         --volume=/home/$USER/rdv_hermai/shared_rdv/rdv_map/backup:/home/rdv/catkin_ws/src/shared_rdv/rdv_map/backup:rw"


    #--entrypoint /bin/bash \
docker run \
    -d \
    --restart unless-stopped \
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

