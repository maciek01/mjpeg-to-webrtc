
docker rm pi-nginx


docker run -u root --restart always -d --entrypoint=/bin/sh -p 8090:80 -v /var/log/nginx:/var/log/nginx --name pi-nginx  maciekkolesnik/mjpeg-to-webrtc-pi -c "/etc/init.d/nginx start; tail -f /etc/passwd"

