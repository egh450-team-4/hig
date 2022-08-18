#!/bin/bash -i
# This script should be executed
# on the onboard computer at startup
cd ~/hig;
git fetch --all;
git reset --hard origin/master;
sh onboard.sh;
