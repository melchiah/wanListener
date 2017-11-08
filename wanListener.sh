#!/bin/bash

# This script will check every ammount of time set for wan ip change.
# Script should record in wanip_log.txt along with timestamp.
# If there is change in wan ip address program will send an e-amil
# in order to inform administartor about the change occured.

source /home/pi/.my_scripts/wanListener/wanListener_dep.sh

readonly LOG_DIR="$(pwd)/wanip_log.csv"

readonly MINUTES=60
readonly HOURS=$(( $MINUTES * $MINUTES ))


# Set listener to continuosly check for WAN address and see if changes occured.
intervalWanIpCheck
