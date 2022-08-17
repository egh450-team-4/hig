#!/bin/bash -i
# This script should be executed
# on the onboard computer at startup
cd ~/hig && git fetch --all && git reset --hard origin/master
cd ~
disros
sleep 1;
roscore &
sleep 10;
roslaunch qutas_lab_450 environment.launch &
sleep 10;
roslaunch ~/catkin_ws/launch/control.launch &
sleep 1;
rosrun depthai_publisher dai_publisher &
