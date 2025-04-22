# Server Performance Analyzer

## Overview

`server-stats.sh` is a Bash script that provides a quick snapshot of your Linux server's performance metrics. It helps system administrators and developers monitor key server statistics for debugging and performance analysis.

## Features

### Core Metrics
- **CPU Usage**: Total CPU utilization percentage
- **Memory Usage**: Breakdown of free vs used memory with percentages
- **Disk Usage**: Summary of disk space usage with percentages
- **Process Monitoring**: 
  - Top 5 processes by CPU consumption
  - Top 5 processes by memory usage

### Optional Extended Metrics (Stretch Goals)
- OS version information
- System uptime
- Load averages
- Currently logged in users
- Failed login attempts

## Prerequisites

- Linux-based operating system
- Bash shell
- Basic utilities: `top`, `free`, `df`, `uptime`

## Installation

1. Download the script:
```bash
wget https://example.com/path/to/server-stats.sh
```

2. Make it executable:
```bash
chmod +x server-stats.sh
```

## Usage

Basic execution:
```bash
./server-stats.sh
```

Verbose mode (includes stretch goal metrics):
```bash
./server-stats.sh -v
```

Save output to file:
```bash
./server-stats.sh > server_stats_$(date +%Y%m%d).txt
```

## Sample Output

```
============= SERVER PERFORMANCE STATS =============
[Timestamp] 2023-11-15 14:30:45 UTC

=== CPU Usage ===
Total CPU Usage: 24.7%

=== Memory Usage ===
Total: 7.6GB, Used: 5.1GB (67%), Free: 2.5GB (33%)

=== Disk Usage ===
/dev/root: 50GB total, 35GB used (70%), 15GB free (30%)

=== Top Processes ===
Top 5 by CPU:
1. nginx (12.5%)
2. mysql (8.2%)
3. php-fpm (3.1%)
4. sshd (0.5%)
5. cron (0.3%)

Top 5 by Memory:
1. java (1.2GB)
2. mysql (850MB)
3. nginx (420MB)
4. php-fpm (380MB)
5. redis-server (150MB)

=== Extended Stats ===
OS: Ubuntu 20.04.3 LTS
Uptime: 15 days, 4 hours, 22 minutes
Load Average: 1.25, 1.10, 0.95
Logged in users: 2
Failed logins (last 24h): 3
===================================================
```

## Customization

Edit the script to:
- Change refresh interval (for continuous monitoring)
- Add additional metrics
- Modify output formatting
- Set thresholds for warning/alert levels

## Troubleshooting

If you encounter issues:
1. Verify you have execute permissions
2. Check if required commands are installed (`top`, `free`, `df`)
3. Run with `bash -x server-stats.sh` for debug output

## Security Considerations

- The script requires no special privileges for basic stats
- Some extended metrics may require `sudo` access
- Review script contents before running with elevated privileges

