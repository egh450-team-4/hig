#!/bin/bash -i
# This script should be executed
# on the onboard computer at startup
cd ~/hig && git fetch --all && git reset --hard origin/master;
cd ~;
PATH="/opt/ros/noetic/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin";
echo "1";
echo "PATH IS $PATH";
echo $PATH;
echo "2";
disros
sleep 1;
echo "[onboard] running roscore"
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
