#!/bin/bash

BACKUPS_DESTINATION="/run/media/christian/BD05-1343"
EXCLUDE_FILE_PATH="./exclude_from_backup.txt"

# stop the script if an error occurs
set -e

rsync -a --delete --verbose --human-readable --progress --exclude-from=$EXCLUDE_FILE_PATH /home/christian $BACKUPS_DESTINATION/home
rsync -a --delete --verbose --human-readable --progress /etc $BACKUPS_DESTINATION

echo "Made backups on: $(date)" >> /var/log/backup.log

