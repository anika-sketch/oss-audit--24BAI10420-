#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Anika Saxena(24BAI10420) | Course: Open Source Software
# Description: Reads a log file line by line, counts occurrences of a keyword, prints a summary, and shows the last 5 matching lines. Retries if the file is empty.
# ============================================================

# --- Command-line arguments ---
# $1 = path to the log file (required)
# $2 = keyword to search for (optional, defaults to 'error')
LOGFILE=$1
KEYWORD=${2:-"error"}   # Default keyword if none provided

# --- Counter variable to track keyword occurrences ---
COUNT=0

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

# --- Check that the file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

# --- do-while style retry loop if file is empty ---
# Bash has no native do-while, so we use: while true + break
MAX_RETRIES=3
ATTEMPT=0

while true; do
    ATTEMPT=$((ATTEMPT + 1))

    # Check if file is empty using -s (true if file has size > 0)
    if [ -s "$LOGFILE" ]; then
        break   # File has content, proceed
    fi

    echo "Warning: '$LOGFILE' appears to be empty. (Attempt $ATTEMPT of $MAX_RETRIES)"

    # After max retries, exit gracefully
    if [ "$ATTEMPT" -ge "$MAX_RETRIES" ]; then
        echo "Error: File is still empty after $MAX_RETRIES checks. Exiting."
        exit 1
    fi

    # Wait 2 seconds before retrying (simulates a log file being written to)
    sleep 2
done

echo "=================================================="
echo " Log File Analyzer"
echo " File    : $LOGFILE"
echo " Keyword : '$KEYWORD'"
echo "=================================================="

# --- while read loop: process the log file line by line ---
# IFS= preserves leading/trailing whitespace in each line
# -r prevents backslash interpretation
while IFS= read -r LINE; do

    # if-then: check if the current line contains the keyword (case-insensitive with -i)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter
    fi

done < "$LOGFILE"   # Redirect file as input to the while loop

# --- Print summary ---
echo ""
echo " Keyword '$KEYWORD' found $COUNT time(s) in $LOGFILE"
echo ""

# --- Print the last 5 matching lines using grep + tail ---
echo "--------------------------------------------------"
echo " Last 5 lines containing '$KEYWORD':"
echo "--------------------------------------------------"

# grep -i for case-insensitive match, pipe to tail to get last 5
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -5)

if [ -z "$MATCHES" ]; then
    echo " (No matching lines found)"
else
    echo "$MATCHES"
fi

echo "=================================================="
