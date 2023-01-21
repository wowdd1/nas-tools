#!/bin/bash

sudo apt update

sudo apt install fuse -y
sudo apt install inotify-tools -y

#/workspaces/nas-tools/rclone/rclone ls alist: --config="/workspaces/nas-tools/rclone/rclone.conf"

nohup /workspaces/nas-tools/rclone/rclone mount alist:/ /workspaces/nas-tools/data/source --config="/workspaces/nas-tools/rclone/rclone.conf" --vfs-cache-mode full --allow-non-empty --log-file /workspaces/nas-tools/rclone/rclone.log --log-level NOTICE &