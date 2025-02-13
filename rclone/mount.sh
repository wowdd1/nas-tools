#!/bin/bash


#/workspaces/nas-tools/rclone/rclone ls alist: --config="/workspaces/nas-tools/rclone/rclone.conf"

#nohup /workspaces/nas-tools/rclone/rclone mount alist:/ /workspaces/nas-tools/data/source --config="/workspaces/nas-tools/rclone/rclone.conf" --vfs-cache-mode full --allow-non-empty --log-file /workspaces/nas-tools/rclone/rclone.log --log-level NOTICE &



#nohup $PWD/rclone mount alist:/ $PWD/../data/source --config="$PWD/rclone.conf" --vfs-cache-mode full --allow-non-empty --log-file $PWD/rclone.log --log-level NOTICE &

#$PWD/rclone mount alist:/ $PWD/../data/source --config="$PWD/rclone.conf" --vfs-cache-mode full --allow-non-empty --log-file $PWD/rclone.log --log-level NOTICE

DIR="$PWD/../../nas-data"

if [ ! -d "$DIR" ]; then
  cp -rf $PWD/../nas-data $PWD/../../
fi

#sync
#$PWD/rclone sync $DIR/source alist:/ -P

#mound
$PWD/rclone mount alist:/ $DIR/source --config="$PWD/rclone.conf" --vfs-cache-mode full --allow-non-empty --log-file $PWD/rclone.log --log-level NOTICE
