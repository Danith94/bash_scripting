#!/bin/bash
if [ "$#" -eq 0 ]; then
        echo " Incorrect Arguement passed....."
        exit 1
fi
SOURCE=$1  # file or directory to be archived
BUCKET_NAME="s3://backup-bucket"  # AWS S3 bucket name
DATE=$(date +%Y%m%d)
BACKUP_DIR="backup/"   #server backup path
mkdir -p $BACKUP_DIR
tar -czf "$BACKUP_DIR/$DATE.tar.gz" $1
echo "Backup file is copying to the S3 bucket"
sleep 2
aws s3 cp $BACKUP_DIR $BUCKET_NAME   #copy backup file to S3 bucket
if [ $? -eq 0 ]; then
        echo "file backup was successful."
        rm -r $BACKUP_DIR/*.tar.gz
        exit 0
else
        echo "file backup was unsuccessful. "
        exit 1
