#!/bin/bash

image_dir="/var/www/html/webcam_images"

while true; do
    timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    formatted_timestamp=$(date --date="$timestamp" -u +"%Y%m%d_%H%M%S") # Use UTC time for filename
    image_path="$image_dir/${formatted_timestamp}.jpg"
    latest_txt="$image_dir/latest.txt"
    latest_symlink="$image_dir/latest.jpeg"

    # Capture image using fswebcam
    fswebcam -r 1280x720 --jpeg 95 -D 1 --no-banner "$image_path"

    echo "Image captured at $timestamp"

    # Write timestamp to "latest.txt" file
    echo "$timestamp" >"$latest_txt"

    # Update symlink "latest.jpeg" to point to the newest image
    ln -sf "$image_path" "$latest_symlink"

    sleep 5
done
