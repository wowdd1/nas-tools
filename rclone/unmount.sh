#!/bin/bash


pid=`pgrep 'rclone'`

echo $pid

if [ "$pid" = "" ]
then
  echo "pid is not set!"
else
  echo "pid is set !"
  echo "kill $pid rclone"
  pgrep 'rclone'|xargs kill -9
fi


DIR="$PWD/../../nas-data"

echo "unmount $DIR"

fusermount -quz $DIR/source 

#umount $DIR/source
