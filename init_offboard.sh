#!/bin/sh
. ./home/gcsteam/.bashrc
git fetch --all
git reset --hard origin/master
npm install
# This script should be executed
# on the offobard computer at startup
IP=$(node hig.js)
USERNAME="uavteam4"
echo "Enter the password (1234)";
# Asks the onboard computer to run the init procedure
ssh $USERNAME@$IP sh /home/uavteam4/hig/init_onboard.sh
# Setup offboard computer
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
disros $IP;
rqt &
echo "done"
