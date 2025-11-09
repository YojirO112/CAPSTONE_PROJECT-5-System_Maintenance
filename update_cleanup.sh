#update_cleanup
set -euo pipefail
LOG_DIR="$HOME/SystemMaintenance/logs"
LOG_FILE="$LOG_DIR/update_cleanup.log"
TEMP_DIR="$TEMP"
DATE=$(date +%Y-%m-%d)

mkdir -p "$LOG_DIR"

echo "===== UPDATE & CLEANUP STARTED at $(date) =====" | tee -a "$LOG_FILE"
# ------------------------------------
# Simulated System Update Section
#-------------------------------------

echo "[INFO] Checking for system updates (simulated)..." | tee -a "$LOG_FILE"
sleep 1
echo "[INFO] All system components are up to date." | tee -a "$LOG_FILE"

# ---------------------------------
# Cleanup Temporary Files Section
# ---------------------------------

echo "[INFO] Cleaning temporary files older than 7 days..." | tee -a "$LOG_FILE"
# Delte old temp files and log results
if find "$TEMP_DIR" -type f -mtime +7 -print -delete 2>/dev/null >> "$LOG_FILE"; then
    echo "[SUCCESS] Temporary files older than 7 days removed successfully." | tee -a "$LOG_FILE"
else
    echo "[WARNING] Some temporary files could not be deleted." | tee -a "$LOG_FILE"
fi

#-----------------------------------
# Cleanup Log Files Section
#-----------------------------------

echo "[INFO] Cleaning old maintenance logs (older than 30 days)..." | tee -a "$LOG_FILE"

find "$LOG_DIR" -type f -name "*.log" -mtime +30 -print -delete >> "$LOG_FILE" 2>/dev/null || true
echo "[INFO] Log cleanup complete." | tee -a "$LOG_FILE"


#-----------------------------------
#Optional Cache Cleanup Section
#-----------------------------------

echo "[INFO] Cleaning system cache (simulation)..." | tee -a "$LOG_FILE"
sleep 1
echo "[INFO] Cache cleaned successfully." | tee -a "$LOG_FILE"

#-----------------------------------
#Finish Script
#-----------------------------------
echo "===== UPDATE & CLEANUP FINISHED at $(date) =====" | tee -a "$LOG_FILE"
echo " Update &Cleanup completed. Log saved at $LOG_FILE"

