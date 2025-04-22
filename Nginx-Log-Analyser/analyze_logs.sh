#!/bin/bash

LOG_FILE="logfile.txt"

# Check if file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' not found!"
    exit 1
fi

echo "Processing log file: $LOG_FILE"
echo "----------------------------------------"

# Top 5 IP addresses with the most requests
echo "1. Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5
echo ""

# Top 5 most requested paths
echo "2. Top 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5
echo ""

# Top 5 response status codes
echo "3. Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5
echo ""

# Top 5 user agents
echo "4. Top 5 user agents:"
awk -F'"' '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5
echo "----------------------------------------"