LOG_FILE="echo/sample_system.log"
ALERT_FILE="$HOME/alert_log.txt"
PATTERN="(error|fail|warning)"
if [[ ! -f "$LOG_FILE" ]]; then
	echo "System started successfully" > "$LOG_FILE"
	echo "Disk warning: Low space on drive C:" >> "$LOG_FILE"
	echo "User login failed: invalid password" >> "$LOG_FILE"
fi

grep -iE "$PATTERN" "$LOG_FILE" > "$ALERT_FILE"
if [[ -s "ALERT_FILE" ]];then
	echo " Alerts found! Check $ALERT_FILE"
else
	echo " No alerts detected."
fi
