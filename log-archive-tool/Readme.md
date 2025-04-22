# Log Archiver CLI Tool

## Overview

The Log Archiver is a command-line utility that helps system administrators automatically compress and archive log files on a scheduled basis. This tool maintains system cleanliness by removing old logs while preserving them in compressed format for future reference.

## Features

- Compresses log files into tar.gz archives
- Creates timestamped archive directories
- Maintains operation logs for auditing
- Simple command-line interface
- Preserves original log files during compression

## Installation

### Prerequisites
- Unix-based system (Linux, macOS)
- `tar` utility (usually pre-installed)
- Basic command-line knowledge

### Installation Steps

1. Make it executable:
```bash
chmod +x log-archive.sh
```

2. Move to your PATH (optional):
```bash
sudo mv log-archive.sh /usr/local/bin/log-archive
```

## Usage

### Basic Command
```bash
log-archive <log-directory>
```

### Example
```bash
# Archive system logs
log-archive /var/log

# Archive application logs
log-archive /opt/myapp/logs
```

### Expected Output
```
Archiving logs from: /var/log
Created archive: /var/log/archive/logs_archive_20240816_100648.tar.gz
Operation logged to: /var/log/archive/archive.log
```

## Archive Structure

Archives are named with timestamp format:
```
logs_archive_YYYYMMDD_HHMMSS.tar.gz
```

Example:
```
logs_archive_20240816_100648.tar.gz
```

## Operation Log

The tool maintains an operation log at:
```
<log-directory>/archive/archive.log
```

Log entries include:
- Timestamp of operation
- Source directory
- Archive file created
- Number of files compressed

## Scheduling Regular Archives

Add to crontab for automatic daily archiving:
```bash
0 2 * * * /usr/local/bin/log-archive /var/log
```
(Runs daily at 2:00 AM)

## Configuration Options

Edit the script to modify:
- Archive destination directory
- Compression level
- File retention policy
- Logging verbosity

## Security Considerations

- Runs with user permissions
- Preserves original file permissions in archives
- Logs all operations for auditing

## Troubleshooting

Common issues:
1. **Permission denied**: Run with `sudo` or adjust directory permissions
2. **tar not found**: Install tar (`sudo apt install tar` on Debian/Ubuntu)
3. **No space left**: Check disk space with `df -h`

## Documentation Reference

Learn more about the `tar` command:
```bash
man tar
```
or visit [GNU Tar Manual](https://www.gnu.org/software/tar/manual/)
