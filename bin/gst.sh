#!/bin/sh

sudo /etc/init.d/nginx start

sudo /etc/init.d/janus start


#gst-launch-1.0 -e  udpsrc port=3333 ! application/x-rtp, encoding-name=JPEG, payload=26 ! rtpjpegdepay ! jpegdec ! vp8enc ! rtpvp8pay ! udpsink sync=false host=127.0.0.1 port=5004


#gst-launch-1.0 -e  udpsrc port=3333 ! application/x-rtp, encoding-name=JPEG, payload=26 ! rtpjpegdepay ! jpegdec ! videoflip method=rotate-180 ! omxh264enc target-bitrate=5000000 control-rate=variable  ! rtph264pay config-interval=1 pt=96  ! udpsink sync=false host=127.0.0.1 port=8004


gst-launch-1.0 -e  udpsrc port=3333 ! application/x-rtp, encoding-name=JPEG, payload=26 ! rtpjpegdepay ! jpegdec !  omxh264enc target-bitrate=5000000 control-rate=variable  ! rtph264pay config-interval=1 pt=96  ! udpsink sync=false host=127.0.0.1 port=8004
