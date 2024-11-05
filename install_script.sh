#!/bin/bash

#sudo apt install novnc -y
#sudo dpkg -i ./turbovnc_3.0.3_amd64.deb
#git clone https://github.com/novnc/websockify noVNC/utils/websockify
#
#/opt/TurboVNC/bin/vncserver -version

apt install novnc websockify -y
apt-get install -y libxt6 libxext6 xauth x11-xkb-utils xkb-data
#git clone https://github.com/novnc/websockify noVNC/utils/websockify
dpkg -i ./turbovnc_3.0.3_amd64.deb

#/opt/TurboVNC/bin/vncserver -version
