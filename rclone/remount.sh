#!/bin/bash


echo "rclone unmount"
./unmount.sh

echo "rclone mount"
nohup ./mount.sh &
