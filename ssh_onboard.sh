#!/bin/bash -i
cd hig;
IP=$(node hig.js)
echo "Enter the password (1234), then run sh hig/init_onboard.sh"
ssh uavteam4@$IP
