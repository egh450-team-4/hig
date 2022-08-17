# This script should be executed
# on the offobard computer at startup
IP=$(node hig.js)
USERNAME="uavteam4"
echo "Enter the password (1234)";
# Asks the onboard computer to run the init procedure
ssh $USERNAME@$IP sh ~/hig/init_onboard.sh
# Setup offboard computer
disros $IP &
rqt &
echo "done"
