# wanListener

# A bash script for checking hourly changes in WAN ip-address.
# If any change occured in dynamic WAN ip-address provided by ISP Modem,
# this bash script will send information via ssmtp program with sendmail command.
# This script also logs history of WAN ip-address along with date and time in wanip_log.csv.
# ./wanListener/wanListener.sh is run in /etc/rc.local code in order for program to run at boot.
# Use & to run in background at boot.
# Also after installing ssmtp /etc/ssmtp revaliases and ssmtp.conf must be set accordingly.
# Refer to https://help.ubuntu.com/community/EmailAlerts link for setup.
