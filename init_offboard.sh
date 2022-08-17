#!/bin/sh
# This script should be executed
# on the offobard computer at startup
git fetch --all
git reset --hard origin/master
npm install
IP=$(node hig.js)
disros() {
  # Setup for distributed ROS
  export ROS_IP="$(hostname -I | cut -d' ' -f1)"
  echo "Identifying as: $ROS_IP"
  if [ "$#" -eq 1 ]
  then
    export ROS_MASTER_URI="http://$1:11311"
    echo "Connecting to: $ROS_MASTER_URI"
  fi
}
echo "[offboard] running disros";
disros $IP;
echo "[offboard] running rqt";
rqt &
echo "[offboard] DONE";
