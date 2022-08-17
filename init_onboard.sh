#!/bin/sh
# This script should be executed
# on the onboard computer at startup
cd ~/hig && git fetch --all && git reset --hard origin/master
cd ~
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
disros
sleep 1;
roscore &
sleep 10;
roslaunch qutas_lab_450 environment.launch &
sleep 10;
roslaunch ~/catkin_ws/launch/control.launch &
sleep 1;
rosrun depthai_publisher dai_publisher &
