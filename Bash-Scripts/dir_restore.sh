#!/bin/bash

# Set the backup source and destination directories
backup_src="/mnt/share"
backup_dest="/"

# Set the owner and group for the restored files and directories
owner="zeeshan"
group="cloudops"

# Set the log file location and name
log_file="/var/log/is_restore.log"

# Create the log file if it doesn't exist
if [ ! -e $log_file ]; then
  touch $log_file
fi

# Define a function for logging messages
log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') $1" >> $log_file
}

# Check if the backup destination directory exists, and create it if it doesn't
if [ ! -d $backup_dest ]; then
  log "Creating directory $backup_dest"
  mkdir -p $backup_dest
  chown $owner:$group $backup_dest
fi

# Log the start of the restore process
log "Starting restore of $backup_src to $backup_dest"

# Use rsync to restore the incremental backup to the destination directory
rsync -avz --delete --exclude="lost+found" $backup_src/current/ $backup_dest/

# Set the owner and group for the restored files and directories
chown -R $owner:$group $backup_dest

# Log the completion of the restore process
log "Restore completed successfully"
