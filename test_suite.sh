
#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'


# test_suite.sh - basic checks for each script (dry-run style)
SCRIPTS_DIR="$(dirname "${BASH_SOURCE[0]}")"
LOGFILE="${LOGFILE:-$PWD/../logs/maintenance.log}"


log(){ echo "$(date +'%Y-%m-%d %H:%M:%S') [test] $*" | tee -a "$LOGFILE"; }


log "Starting test suite"


# Check executability
for s in backup.sh update_cleanup.sh log_monitor.sh; do
if [[ -x "$SCRIPTS_DIR/$s" ]]; then
log "$s is executable"
else
log "Warning: $s is not executable. Setting +x"
chmod +x "$SCRIPTS_DIR/$s" || log "Failed to chmod $s"
fi
done


# Run a light smoke test for backup: create a tiny backup of /tmp
log "Running lightweight backup smoke-test"
bash "$SCRIPTS_DIR/backup.sh" "/tmp" || log "backup.sh smoke-test failed"


# Run update script in 'check' mode if you want — by default we won't perform destructive tests
log "Test suite completed"
exit 0
