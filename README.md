## ⚠️ Project Abandoned ⚠️
I started working on this project because I wanted to get notifications when the washing machine was done. My first attempt was to measure the power usage, using an energy monitoring smart plug. I couldn't get that to work, the data was just too noisy, and I couldn't get it to reliably distinguish between "wash is done" and "pause between wash and rinse cycles". My second attempt, found here, was to use a webcam and beaglebone black I had lying around to do image recognition on the indicator lights.

Because life is funny, shortly after I started working on that, the washing maching stopped working and had to be replaced. The replacement has WiFi built in, and [some sort of cloud account](https://www.geappliances.com/connect), which I don't use, but which Home Assistant [can hook into](https://github.com/simbaja/ha_gehome). Not ideal, but Good Enough.

---

# laundry-watcher
Washing machine status and notifications using image recognition

Status: webcam usage proof of concept

## Installing

```
sudo ./install.sh
```

Reuses the existing nginx setup running on the default debian beaglebone image. We just need to replace the `index.html` file served up on port 80, and create a place to save the images to.

* Images are saved to `/var/www/html/webcam_images`.
* The script is installed as a systemd service, and triggered via a systemd timer every 5 minutes.

## Running manually

It can be invoked manually with:

```
$ sudo systemctl start laundry-watcher-capture-image.service
```

or extra-manually with:

```
$ sudo /opt/laundry-watcher/capture_image.sh
--- Opening /dev/video0...
Trying source module v4l2...
/dev/video0 opened.
No input was specified, using the first.
Delaying 1 seconds.
--- Capturing frame...
Captured frame in 0.00 seconds.
--- Processing captured image...
Setting output format to JPEG, quality 95
Disabling banner.
Writing JPEG image to '/var/www/html/webcam_images/20240129_185329.jpg'.
Image captured at 2024-01-29T18:53:29Z
```
