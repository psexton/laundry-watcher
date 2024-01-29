#!/usr/bin/bash

# set up the html viewer
cp viewer.html /var/www/html/index.html
mkdir -p /var/www/html/webcam_images

# set up the capture_image script
mkdir -p /opt/laundry-watcher
cp capture_image.sh /opt/laundry-watcher
chmod 755 /opt/laundry-watcher/capture_image.sh

# set up the systemd daemon & timer
cp laundry-watcher-capture-image.service /etc/systemd/system
cp laundry-watcher-capture-image.timer /etc/systemd/system
systemctl daemon-reload
systemctl enable laundry-watcher-capture-image.timer
systemctl start laundry-watcher-capture-image.timer
