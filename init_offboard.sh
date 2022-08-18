#!/bin/sh
# This script should be executed
# on the offobard computer at startup
cd hig;
git fetch --all
git reset --hard origin/master
sh offboard.sh
