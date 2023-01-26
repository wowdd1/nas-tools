#!/bin/bash


export NASTOOL_CONFIG=$PWD/config/config.yaml

echo $NASTOOL_CONFIG

source_dir="$PWD/../nas-data/source"
target_dir="$PWD/../nas-data/target"

#python3 app/filetransfer.py -m softlink -s $source_dir -d $target_dir


pid=`pgrep 'main.sh'`

echo $pid

if [ "$pid" = "" ]
then
  echo "nas tools not running"
  
  #nohup ./main.sh &
  #sleep 5
  #pid=`pgrep 'main.sh'`
  #echo "main.sh pid: $pid"
else
  echo "main.sh is running pid: $pid"
  #echo "kill $pid sftpgo"
  #pgrep 'sftpgo'|xargs kill -9
fi



#cd rclone
#./unmount.sh
#nohup ./mount.sh &
#cd ..

#echo "sleep 3 second"
#sleep 3

echo "ls source dir:"
ls $source_dir

#echo $PWD

#echo "let nas tools sync"

#curl -X 'GET'   'http://localhost:8082/api/v1/sync/run'   -H 'accept: application/json' --header 'Authorization: GlkcvLuoygdevU2P'



pid=`pgrep 'sftpgo'`

echo $pid

if [ "$pid" = "" ]
then
  echo "sftp not running, start sftpgo"
  cd sftpgo
  nohup ./sftpgo serve &
  sleep 1.5
  pid=`pgrep 'sftpgo'`
  echo "sftpgo pid: $pid"
else
  echo "sftp is running pid: $pid"
  #echo "kill $pid sftpgo"
  #pgrep 'sftpgo'|xargs kill -9
fi

