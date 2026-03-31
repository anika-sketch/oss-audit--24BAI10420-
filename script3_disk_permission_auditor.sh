#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Anika Saxena(24BAI10420) | Course: Open Source Software
# Description: Loops through key system directories and reports their disk usage, owner, and permissions.It also checks the config directory of chosen software.
# ============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

# --- Config directory of your chosen FOSS software ---
SOFTWARE_CONFIG_DIR="/etc/mysql"
SOFTWARE_NAME="MySQL 8.0"

# --- Print report header ---
echo "=================================================="
echo " Directory Audit Report"
echo " Generated: $(date '+%d %B %Y %H:%M:%S')"
echo "=================================================="
printf "%-20s %-30s %-10s\n" "Directory" "Permissions (type user group)" "Size"
echo "--------------------------------------------------"

# --- for loop: iterate over each directory in the array ---
for DIR in "${DIRS[@]}"; do

    # Check if the directory exists before trying to inspect it
    if [ -d "$DIR" ]; then

        # Use ls -ld and awk to extract: permissions, owner, group
        # awk '{print $1, $3, $4}' pulls columns 1 (perms), 3 (user), 4 (group)
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # Use du -sh to get human-readable size; suppress permission errors with 2>/dev/null
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print formatted output
        printf "%-20s %-30s %-10s\n" "$DIR" "$PERMS" "$SIZE"

    else
        # Directory does not exist on this system
        printf "%-20s %-40s\n" "$DIR" "[does not exist on this system]"
    fi

done

echo ""
echo "=================================================="
echo " Software Config Directory Check: $SOFTWARE_NAME"
echo "=================================================="

# --- Check if the software's config directory exists ---
if [ -d "$SOFTWARE_CONFIG_DIR" ]; then

    # Get permissions of the config directory
    CONFIG_PERMS=$(ls -ld "$SOFTWARE_CONFIG_DIR" | awk '{print $1, $3, $4}')
    CONFIG_SIZE=$(du -sh "$SOFTWARE_CONFIG_DIR" 2>/dev/null | cut -f1)

    echo " Config Dir  : $SOFTWARE_CONFIG_DIR"
    echo " Permissions : $CONFIG_PERMS"
    echo " Size        : $CONFIG_SIZE"
    echo ""

    # List top-level contents of the config directory
    echo " Contents of $SOFTWARE_CONFIG_DIR:"
    ls -lh "$SOFTWARE_CONFIG_DIR" 2>/dev/null | awk 'NR>1 {printf "  %-12s %-10s %s\n", $1, $5, $9}'

else
    echo " Config directory $SOFTWARE_CONFIG_DIR does NOT exist."
    echo " $SOFTWARE_NAME may not be installed on this system."
fi

echo "=================================================="
