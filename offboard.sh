#!/bin/sh
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
echo "[offboard] running custom marker";
rosrun node_opi cusmarker.py &
echo "[offboard] running espeaker";
rosrun node_opi espeaker.py &
echo "[offboard] DONE";
