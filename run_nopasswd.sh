#!/bin/bash

export PATH=$PATH:/opt/TurboVNC/bin/
 
LOCK_FILE="/tmp/.X9-lock"
if [ -f "$LOCK_FILE" ]; then
    echo "Removing lock file: $LOCK_FILE"
    sudo rm -f "$LOCK_FILE"
fi
 
 
XAUTHORITY_FILE="/root/.Xauthority"
if [ ! -f "$XAUTHORITY_FILE" ]; then
    touch "$XAUTHORITY_FILE"
fi
 
CURPATH=$(pwd)
PATH_NOVNC=$CURPATH/noVNC
NOVNC=$PATH_NOVNC/utils/novnc_proxy
 
if [ "$(lsof -ti:6080)" ]; then
    lsof -ti:6080 | xargs kill -9
fi
 
/opt/TurboVNC/bin/vncserver -kill :9
#/opt/TurboVNC/bin/vncserver :9 -wm /usr/bin/xfce4-session
/opt/TurboVNC/bin/vncserver :9 -wm /usr/bin/xfce4-session -SecurityTypes None -geometry 1280x800
#/opt/TurboVNC/bin/vncserver :9 -SecurityTypes None -geometry 1280x720
 
 
if [ -f "$NOVNC" ]; then
    $NOVNC --vnc $HOSTNAME:5909
else
    echo "Error: $NOVNC does not exist!"
fi
