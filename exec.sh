
docker rm pi-temp

docker run -ti --entrypoint=bash -p 3333:3333/UDP -p 8090:80 -p 8088:8088 -p 5004:5004/UDP -p 8004:8004/UDP --privileged --device /dev/vchiq:/dev/vchiq -v /var/log/nginx:/var/log/nginx -v /var/log/janus:/var/log/janus --name pi-temp  maciekkolesnik/mjpeg-to-webrtc-pi

#docker run -ti --entrypoint=/bin/sh  -p 3333:3333/UDP -p 8090:80 -p 8088:8088 -p 5004:5004/UDP -p 8004:8004/UDP --privileged --device /dev/vchiq:/dev/vchiq -v /var/log/nginx:/var/log/nginx -v /var/log/janus:/var/log/janus --name pi-temp  maciekkolesnik/mjpeg-to-webrtc-pi -c /home/janus/bin/gst.sh
