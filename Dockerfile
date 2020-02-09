
#FROM maciekkolesnik/janus-pi
FROM maciekkolesnik/janus-pi:v3


# file maintainer author
MAINTAINER maciek kolesnik <maciek@kolesnik.org>

# docker build environments


#pre install placements
COPY install.sh /home/janus/install.sh
COPY packages /home/janus/packages
COPY bin /home/janus/bin
COPY opt /opt
COPY etc /etc


#permissions
RUN sudo mkdir /var/log/janus
RUN sudo touch /var/log/janus/janus.log
RUN sudo chown janus:janus -R /var/log/janus/
RUN sudo chown janus:janus -R /home/janus/
RUN sudo usermod -aG video,adm,dialout,cdrom,sudo,audio,video,plugdev,games,users,input janus

#install
RUN sudo apt-get update -y
RUN sudo apt-get upgrade -y
RUN sudo apt-get dist-upgrade -y
RUN sudo /home/janus/install.sh

#post install placements and cleanup
RUN sudo cp -r /home/janus/janus-gateway/html/ /var/www/html/janus
RUN sudo rm -rf /home/janus/janus-gateway


USER janus

CMD ["/bin/sh", "-c", "/home/janus/bin/gst.sh"]

