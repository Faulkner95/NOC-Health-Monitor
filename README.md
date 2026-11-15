# NOC System Health Monitor

## Project Overview

A bash-based system health monitoring tool develop for a theoretical Network Operations Center that collects device telemetry and writes the current usage values to a persistent log file.

The purpose of this project is to demonstrate basic linux knowledge required for sys admin compitence in the real world.

## Features

- **CPU Monitoring:** Collects and displays the system's one-minute load average using `uptime`.
- **Memory Monitoring:** Reports available system memory using `free`.
- **Disk Monitoring:** Measures root filesystem utilization using `df`.
- **Threshold Evaluation:** Uses Bash conditional logic to notify users when disk utilization is at or above 80%.
- **Persistent Logging:** Adds timestamped health reports to the persistent `logs/system_health.log` file.
- **Automated Monitoring:** Designed to support scheduled execution.
 
## Prerequisites

The following are required to run this project:

- Linux operating system (Ubuntu or another compatible distribution).
- Bash shell.
- Standard Linux utilities:
  - `uptime`
  - `free`
  - `df`
  - `awk`
  - `sed`
  - `date`
- Cron service for automated  execution.
- Git (for cloning the repository).

## Repository Structure

```text
NOC-Health-Monitor/
├── health_check.sh       # Main Bash monitoring script
├── logs/
│   └── system_health.log # Generated monitoring reports
├── docs/                 # Project documentation
├── .gitignore            # Excludes generated and temporary files
└── README.md             # Project documentation
```

## Installation and Execution

### 1. Clone the Repository

```bash
git clone https://github.com/Faulkner95/NOC-Health-Monitor.git
```

### 2. Navigate to the Project Directory

```bash
cd NOC-Health-Monitor
```

### 3. Create the Log Directory

```bash
mkdir -p logs
```

### 4. Set Execution Permissions

```bash
chmod +x health_check.sh
```

### 5. Run the Monitoring Script

```bash
./health_check.sh
```

### 6. View Monitoring Reports

```bash
cat logs/system_health.log
```

## Automated Monitoring with Cron

The monitoring script can be scheduled to execute automatically using the Linux cron scheduler.

Open crontab:

```bash
crontab -e
```

Add the following entr for hourly telemetry to be added:

```bash
0 * * * * cd /path/to/NOC-Health-Monitor && /path/to/YOURNAMEANDPWD/NOC-Health-Monitor/health_check.sh
```

Adjust to run as frequently as needed.

To verify the scheduled task:

```bash
crontab -l
```
