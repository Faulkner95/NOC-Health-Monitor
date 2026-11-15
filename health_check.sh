#!/bin/bash

# LCCC Cybersecurity
# NOC System Health Monitor
# Author: Faulkner95

# 1. Generate timestamp
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# 2. Gather CPU Telemetry
CPU_LOAD=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d, -f1)

# Display Results
echo "NOC Health Check: $TIMESTAMP"
echo "CPU Load: $CPU_LOAD"
