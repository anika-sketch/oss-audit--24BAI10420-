#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Anika Saxena(24BAI10420) | Course: Open Source Software
# Description: Checks if a chosen FOSS package is installed, displays its version/license/summary, and prints a philosophy note using a case statement.
# ============================================================

# --- Set the package name to inspect ---
PACKAGE="mysql-server"   

# --- Check if this is an RPM-based or Debian-based system ---
# This makes the script portable across distros
if command -v rpm &>/dev/null; then
    PKG_MANAGER="rpm"
elif command -v dpkg &>/dev/null; then
    PKG_MANAGER="dpkg"
else
    echo "Error: No supported package manager found (rpm/dpkg)."
    exit 1
fi

echo "=================================================="
echo " FOSS Package Inspector"
echo "=================================================="
echo " Checking package: $PACKAGE"
echo "--------------------------------------------------"

# --- if-then-else: Check if the package is installed ---
if [ "$PKG_MANAGER" = "rpm" ]; then
    # RPM-based check (Fedora, RHEL, CentOS)
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo " Status  : INSTALLED"
        echo ""
        # Pipe rpm output through grep to extract key fields
        rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary'
    else
        echo " Status  : NOT INSTALLED"
        echo " Install with: sudo dnf install $PACKAGE"
    fi
else
    # Debian-based check (Ubuntu, Debian, Mint)
    if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
        echo " Status  : INSTALLED"
        echo ""
        # Use dpkg -s and grep to extract key fields
        dpkg -s "$PACKAGE" 2>/dev/null | grep -E 'Version|Homepage|Description'
    else
        echo " Status  : NOT INSTALLED"
        echo " Install with: sudo apt install $PACKAGE"
    fi
fi

echo ""
echo "--------------------------------------------------"
echo " Open Source Philosophy Note:"
echo "--------------------------------------------------"

# --- case statement: print a philosophy note per package ---
case $PACKAGE in
    httpd|apache2)
        echo " Apache: the web server that built the open internet."
        echo " It powers over 30% of all websites — born from community, not corporate."
        ;;
    mysql-server|mariadb)
        echo " MySQL/MariaDB: open source at the heart of millions of apps."
        echo " MariaDB forked to keep it free when Oracle acquired MySQL."
        ;;
    vlc)
        echo " VLC: the universal player that plays anything, anywhere."
        echo " Released under GPL — no codecs locked behind paywalls."
        ;;
    firefox)
        echo " Firefox: the browser that keeps the web from being a monopoly."
        echo " Mozilla's mission: internet health over profit."
        ;;
    gimp)
        echo " GIMP: professional image editing, free forever."
        echo " Proof that open-source can match proprietary creative tools."
        ;;
    nginx)
        echo " NGINX: high-performance open-source web server and reverse proxy."
        echo " Now owned by F5, but its open-source roots power the modern web."
        ;;
    *)
        echo " $PACKAGE: an open-source tool that gives users freedom to"
        echo " use, study, share, and improve software — the four essential freedoms."
        ;;
esac

echo "=================================================="
