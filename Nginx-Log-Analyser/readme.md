# Nginx Log Analyzer - Shell Scripting Project

## Overview

This project provides a simple command-line tool for analyzing web server access logs. The script processes an Nginx access log file and extracts key statistics about web traffic, including top IP addresses, requested paths, status codes, and user agents.

## Features

- Identifies the top 5 IP addresses making the most requests
- Shows the top 5 most requested paths/endpoints
- Lists the top 5 HTTP response status codes
- Displays the top 5 user agents accessing your server

## Prerequisites

- Bash shell (Linux/macOS or Windows with WSL)
- Basic command-line knowledge

## Getting Started

1. **Make sure you have the sample log file**:

2. **Make the script executable**:
   ```bash
   chmod +x analyze_logs.sh
   ```

4. **Run the analyzer**:
   ```bash
   ./analyze_logs.sh
   ```

## Expected Output

The script will display formatted statistics in four sections:

```
Processing log file: logfile.txt
----------------------------------------
1. Top 5 IP addresses with the most requests:
   45.76.135.253 - 1000 requests
   142.93.143.8 - 600 requests
   178.128.94.113 - 50 requests
   43.224.43.187 - 30 requests
   178.128.94.113 - 20 requests

2. Top 5 most requested paths:
   /api/v1/users - 1000 requests
   /api/v1/products - 600 requests
   /api/v1/orders - 50 requests
   /api/v1/payments - 30 requests
   /api/v1/reviews - 20 requests

3. Top 5 response status codes:
   200 - 1000 requests
   404 - 600 requests
   500 - 50 requests
   401 - 30 requests
   304 - 20 requests

4. Top 5 user agents:
   Mozilla/5.0 (Windows NT 10.0) - 800 requests
   Mozilla/5.0 (Macintosh) - 600 requests
   curl/7.68.0 - 200 requests
   Python-urllib/3.8 - 100 requests
   PostmanRuntime/7.26.8 - 50 requests
----------------------------------------
```

## Customization

To analyze a different log file:
```bash
./analyze_logs.sh /path/to/your/logfile.log
```

## Troubleshooting

If you encounter issues:
1. Verify the log file exists in the same directory
2. Check that the log format matches standard Nginx combined format
3. Ensure you have read permissions for the log file

## Learning Objectives

This project helps practice:
- Basic shell scripting
- Text processing with awk, sort, and uniq
- Log file analysis
- Command-line tool development

## License

This project is open-source and available for educational purposes.