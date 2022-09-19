#!/bin/bash -i
cd ~;
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
echo "[onboard] running disros";
disros
sleep 1;
echo "[onboard] running roscore";
roscore &
sleep 10;
echo "[onboard] running roslaunch qutas_lab_450";
roslaunch qutas_lab_450 environment.launch &
sleep 10;
echo "[onboard] running catkin's control.launch";
roslaunch ~/catkin_ws/launch/control.launch &
sleep 1;
echo "[onboard] running depthai_publisher";
rosrun depthai_publisher dai_publisher &
echo "[onboard] running aruco_subscriber";
rosrun depthai_publisher aruco_subscriber &
echo "[onboard] launching breadcrumb";
roslaunch ~/catkin_ws/launch/breadcrumb.launch &
echo "[onboard] DONE";
