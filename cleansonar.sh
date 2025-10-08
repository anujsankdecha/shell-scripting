#!/bin/bash

# SonarQube directory
SONAR_DIR="/opt/sonarqube-25"

# Log file for cleanup activity
LOG_FILE="$SONAR_DIR/logs/cleanup.log"

# Current date
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "Cleanup started at $DATE" >> $LOG_FILE

# Delete old temp files (older than 7 days)
find $SONAR_DIR/temp/* -type f -mtime +7 -exec rm -f {} \; >> $LOG_FILE 2>&1

# Delete old logs (older than 30 days)
find $SONAR_DIR/logs/* -type f -mtime +30 -exec rm -f {} \; >> $LOG_FILE 2>&1

# Optional: delete old backup folders, but keep last backup
# find $SONAR_DIR/*-old -type d -mtime +30 -exec rm -rf {} \; >> $LOG_FILE 2>&1

echo "Cleanup finished at $(date '+%Y-%m-%d %H:%M:%S')" >> $LOG_FILE
echo "----------------------------" >> $LOG_FILE
