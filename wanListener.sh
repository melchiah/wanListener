#!/bin/bash

# This script will check every ammount of time set for wan ip change.
# Script should record in wanip_log.txt along with timestamp.
# If there is change in wan ip address program will send an e-amil
# in order to inform administartor about the change occured.

readonly DIR="/home/pi/.my_scripts/wanListener"
readonly LOG_DIR="$DIR/wanip_log.csv"

source $DIR/wanListener_dep.sh

<<<<<<< HEAD
readonly E_MAIL=$1
readonly DYNU_USER=$2
readonly DYNU_PASS=$3
readonly SECS=$4

=======
readonly EMAIL=$1
>>>>>>> 04b2cc331cb4a745fca90b751097c835540f209b
readonly MINUTES=60
readonly HOURS=$(( $MINUTES * $MINUTES ))

# Set listener to continuosly check for WAN address and see if changes occured.
intervalWanIpCheck
