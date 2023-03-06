#!/bin/bash

# Set the backup source and destination directories
backup_src="/opt/share/test"
backup_dest="/mnt/share"

# Set the log file location and name
log_file="/var/log/is_backup.log"

# Create the log file if it doesn't exist
if [ ! -e $log_file ]; then
  touch $log_file
fi

# Define a function for logging messages
log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') $1" >> $log_file
}

# Log the start of the backup process
log "Starting incremental backup of $backup_src to $backup_dest"

# Use rsync to perform an incremental backup of the is directory
rsync -avz --delete --exclude="lost+found" --link-dest=$backup_dest/current $backup_src $backup_dest/incomplete-backup-$(date +%Y-%m-%d-%H-%M-%S)

# Check if the rsync command completed successfully
if [ $? -eq 0 ]; then
  # Move the incomplete backup to the current directory
  mv $backup_dest/incomplete-backup-$(date +%Y-%m-%d-%H-%M-%S) $backup_dest/current

  # Log the successful completion of the backup
  log "Backup completed successfully"
else
  # Log the failure of the backup
  log "Backup failed"
fi
