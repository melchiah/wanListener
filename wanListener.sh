#!/bin/bash

# This script will check every ammount of time set for wan ip change.
# Script should record in wanip_log.txt along with timestamp.
# If there is change in wan ip address program will send an e-amil
# in order to inform administartor about the change occured.

readonly DIR="/home/pi/.my_scripts/wanListener"
readonly LOG_DIR="$DIR/wanip_log.csv"

source $DIR/wanListener_dep.sh

readonly E_MAIL=$1
readonly SECS=$2

readonly MINUTES=60
readonly HOURS=$(( $MINUTES * $MINUTES ))

# Set listener to continuosly check for WAN address and see if changes occured.
intervalWanIpCheck
