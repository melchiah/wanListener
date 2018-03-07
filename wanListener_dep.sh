#!/bin/bash

wanIpCases(){
	local -a SITES=(
	       #"checkip.dynu.com"
		"ifconfig.co"
		"ipecho.net/plain"
		"icanhazip.com"
	)
	
	for i in "${SITES[@]}"
	do
		local IP=$(wget -qO- $i)
		if [ -n "$IP" ]
		then
			WANIP=$IP
			return 0
		fi
	done

}

sendMail(){
	local SNDM=$(which sendmail)
	local LOG="WAN ip-address currently is $WANIP from Franklyn"


	echo "$LOG" | $SNDM $E_MAIL || {
		echo 'Please use sudo with script'; exit 1;
	}

}

dynuIPUpdate(){
	echo "dnyuIPUpdate"

}

# If wanip_log.csv has more than 50 lines previous history lines will
# be deleted for the sake of effeciency.
limitLogFile(){
	local MAX_LINES=20
	local LINES=$(wc -l < $LOG_DIR)
	local TEMP="temp.csv"

	if [ -f $LOG_DIR ] && [ $LINES -gt $MAX_LINES ] ;
	then
		tail -n -$(($MAX_LINES)) $LOG_DIR > $TEMP
	
		# Overwriting wanip_log.csv by using a temporary file
		rm $LOG_DIR
		cp $TEMP $LOG_DIR
		rm $TEMP
	fi
}

timingLogic(){
		if [[ $SECS -eq 0 ]]; then
			echo "Will sleep $(( $MINUTES * 2)) seconds"
			sleep $(( $MINUTES * 2 ))
		elif [[ $SECS -gt 0 ]]; then
			echo "Will sleep $SECS seconds"
			sleep $SECS
		elif [ "$SECS" == '' ]; then
			echo "Unkown parameter..."
			echo "Will sleep $(( $MINUTES * 2)) seconds - default"
			sleep $(( $MINUTES * 2 ))
		fi
}

intervalWanIpCheck(){
	while [ 1 ]
	do
		wanIpCases
		limitLogFile
		timingLogic

		local DATE=$(date)
		local DATA_ROW=$"$WANIP, $DATE"
	
		#echo "$WANIP from WANIP variable"	
		#echo "$(tail -n 1 $LOG_DIR | cut -d ',' -f 1) from tail and cut command"	

		if [ "$WANIP" != "$(tail -n 1 $LOG_DIR | cut -d ',' -f 1)" ]
		then
			sendMail
			dynuIPUpdate	
			#echo "TEST: sent mail"
		fi
		
		if [ -f $LOG_DIR ]
		then
			echo "$DATA_ROW" | tee -a $LOG_DIR
		fi

	done
}
