# laundry-watcher
Washing machine status and notifications using image recognition

Status: webcam usage proof of concept

## Installing

```
sudo ./install.sh
```

Reuses the existing nginx setup running on the default debian beaglebone image. We just need to replace the `index.html` file served up on port 80, and create a place to save the images to.

## Running

```
sudo ./capture_image.sh
```

Will run in an infinite loop, updating the image every 5 seconds.

Output looks like this:
```
$ sudo ./capture_image.sh
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
Writing JPEG image to '/var/www/html/webcam_images/20240125_183326.jpg'.
Image captured at 2024-01-25T18:33:26Z
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
Writing JPEG image to '/var/www/html/webcam_images/20240125_183335.jpg'.
Image captured at 2024-01-25T18:33:35Z
<!--- and so forth --->
```
