#!/bin/bash

# LCCC Cybersecurity
# NOC System Health Monitor
# Author: Faulkner95

# 1. Generate timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# 2. Gather CPU Telemetry
CPU_LOAD=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d, -f1)

# 3. Available RAM awk
RAM_FREE=$(free -m | awk 'NR==2 {print $7}')

# 4. Gather Disk Telemetry
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Display Results
echo "NOC Health Check: $TIMESTAMP"
echo "CPU Load: $CPU_LOAD"
echo "Available RAM: ${RAM_FREE}MB"
echo "Disk Usage: ${DISK_USAGE}%"
