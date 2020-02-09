
docker rm pi-temp

#docker run -ti --entrypoint=bash -p 8090:80 -v /var/log/nginx:/var/log/nginx --name pi-temp  maciekkolesnik/mjpeg-to-webrtc-pi

docker run -u root -ti --entrypoint=/bin/sh -p 8090:80 -v /var/log/nginx:/var/log/nginx --name pi-temp  maciekkolesnik/mjpeg-to-webrtc-pi -c "/etc/init.d/nginx start; tail -f /etc/passwd"

