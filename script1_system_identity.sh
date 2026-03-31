#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Anika Saxena (24BAI0420) | Course: Open Source Software
# Description: Displays a welcome screen with system details including distro, kernel, user, uptime, and license.
# ============================================================

# --- Variables ---
STUDENT_NAME="Anika Saxena"       
SOFTWARE_CHOICE="MySQL 8.0" 

# --- System info using command substitution $() ---
KERNEL=$(uname -r)                        # Kernel version
USER_NAME=$(whoami)                       # Current logged-in user
HOME_DIR=$HOME                            # Home directory of the user
UPTIME=$(uptime -p)                       # Human-readable uptime
CURRENT_DATE=$(date '+%A, %d %B %Y %H:%M:%S')  # Current date and time

# --- Distro name: read from /etc/os-release if available ---
if [ -f /etc/os-release ]; then
    DISTRO=$(grep -w "PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Linux Distribution"
fi

# --- Open-source license message ---
# Most major Linux distros are released under the GNU GPL v2
LICENSE="GNU General Public License v2 (GPLv2)"

# --- Display the report ---
echo "=================================================="
echo "       Open Source Audit — $STUDENT_NAME         "
echo "=================================================="
echo ""
echo "  Software Under Audit : $SOFTWARE_CHOICE"
echo ""
echo "  Distribution         : $DISTRO"
echo "  Kernel Version       : $KERNEL"
echo ""
echo "  Logged-in User       : $USER_NAME"
echo "  Home Directory       : $HOME_DIR"
echo ""
echo "  System Uptime        : $UPTIME"
echo "  Current Date/Time    : $CURRENT_DATE"
echo ""
echo "  Open Source License  : $LICENSE"
echo "  This OS is free software — you can redistribute"
echo "  and/or modify it under the terms of the $LICENSE."
echo ""
echo "=================================================="
