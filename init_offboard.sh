#!/bin/sh
# This script should be executed
# on the offobard computer at startup
git fetch --all
git reset --hard origin/master
sh offboard.sh
