SOURCE_DIRS=("$HOME/Documents" "$HOME/Desktop")
BACKUP_DIR = "$HOME/SystemBackups"
DATE=$(date+%Y-%m-%d)
ARCHIVE_NAME="window_backup_$DATE.tar.gz"

mkdir =p "$BACKUP_DIR"
tar -czf "BACKUP_DIR/$ARCHIVE_NAME" "${SOURCE_DIR[@]}" 2>/dev/null

if [[ $? -eq 0]]; then
	echo "Backup completed successfully!"
	echo "Backup saved to: $BACKUP_DIR/$ARCHIVE_NAME"
else
	echo "Backup failed!"
fi
