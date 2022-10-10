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
sleep 5;
echo "[onboard] running roslaunch qutas_lab_450";
roslaunch qutas_lab_450 environment.launch &
sleep 5;
echo "[onboard] running emulator";
roslaunch spar_node spar_uavasr.launch &
sleep 5;
echo "[onboard] running image node";
rosrun node_image image.py &
echo "[onboard] running payload node"
rosrun node_payload src/payload.py &
echo "[onboard] launching breadcrumb";
roslaunch ~/catkin_ws/launch/breadcrumb.launch &
echo "[onboard] DONE";
