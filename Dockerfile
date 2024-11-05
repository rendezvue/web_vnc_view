FROM ubuntu:jammy
LABEL authors="chlee-rdv"
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /root
# ----------------------------------------------------------------------------------------------
# 지역 설정
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#RUN apt-get update
#RUN apt-get install -y mesa-utils git autoconf libtool python pkg-config libxext-dev libx11-dev x11proto-gl-dev
#
#RUN apt-get update && apt-get install -y --no-install-recommends \
#    vim git wget tar xz-utils udev \
#    python3-pip
# ----------------------------------------------------------------------------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    vim git xfce4 xfce4-goodies dbus-x11 lsof \
    build-essential cmake g++ net-tools libglvnd-dev \
    meshlab gimp
# ----------------------------------------------------------------------------------------------
#RUN git clone https://github.com/NVIDIA/libglvnd /root/libglvnd
#WORKDIR /root/libglvnd
#RUN /root/libglvnd/autogen.sh && /root/libglvnd/configure && make -j && make install
# ----------------------------------------------------------------------------------------------
COPY web_vnc_view /root/web_vnc_view

WORKDIR /root/web_vnc_view
RUN mkdir ~/.vnc
RUN cp xstartup ~/.vnc/

RUN chmod +x ./install_script.sh && ./install_script.sh

CMD ["/root/web_vnc_view/run_nopasswd.sh"]
