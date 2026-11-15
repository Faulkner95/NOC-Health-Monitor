#!/bin/bash

# LCCC Cybersecurity
# NOC System Health Monitor
# Author: Faulkner95

# Define the log file location
LOG_FILE="logs/system_health.log"

# 1. Generate timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# 2. Gather CPU Telemetry
CPU_LOAD=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d, -f1)

# 3. Available RAM awk
RAM_FREE=$(free -m | awk 'NR==2 {print $7}')

# 4. Gather Disk Telemetry
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# 5. Define and Evaluate Disk Usage Threshold
THRESHOLD=80

if [ "$DISK_USAGE" -ge "$THRESHOLD" ]; then
    STATUS="[WARNING] Disk usage is critically high at ${DISK_USAGE}%!"
else
    STATUS="[OK] Disk usage is stable at ${DISK_USAGE}%."
fi



# Display Results
echo "NOC Health Check: $TIMESTAMP"
echo "CPU Load: $CPU_LOAD"
echo "Available RAM: ${RAM_FREE}MB"
echo "Disk Status: $STATUS"


# 7. Write Results to Log File

echo "----------------------------------------" >> "$LOG_FILE"
echo "NOC Health Report - $TIMESTAMP" >> "$LOG_FILE"
echo "CPU Load (1m): $CPU_LOAD" >> "$LOG_FILE"
echo "Available RAM: ${RAM_FREE}MB" >> "$LOG_FILE"
echo "Disk Status: $STATUS" >> "$LOG_FILE"
echo "----------------------------------------" >> "$LOG_FILE"

# Display execution confirmation
echo "Health check executed. Results logged to $LOG_FILE"
