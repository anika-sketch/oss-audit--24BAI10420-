# The Open Source Audit and MySQL 8.0
### Open Source Software 

---

## Student Details

| Field | Details |
|---|---|
| **Student Name** | Anika Saxena |
| **Roll Number** | 24BAI10420 |
| **Course** | Open Source Software |
| **Chosen Software** | MySQL 8.0 (Community Edition) |
| **License** | GNU General Public License v2 (GPL v2) |

---


---

## Repository Contents

```
## script1_system_identity.sh       # System Identity Report
## script2_package_inspector.sh     # FOSS Package Inspector
## script3_disk_permission_auditor.sh  # Disk and Permission Auditor
## script4_log_analyzer.sh          # Log File Analyzer
## script5_manifesto_generator.sh   # Open Source Manifesto Generator
## README.md                        # This file
```

## Project Overview
This repository contains my research and practical implementation for the OSS Audit module. My work focuses on MySQL 8.0, exploring its transition from a personal project by Monty Widenius to a global standard in the LAMP stack. Alongside the research, I have developed five Bash scripts to demonstrate how open-source databases interact with a Linux environment.

## About MySQL

MySQL is an open-source relational database management system originally created by Michael Widenius (Monty) and David Axmark in Sweden in 1995. It was named after Monty's daughter "My". It is released under the GPL v2 license for community use and a commercial license for proprietary embedding.


## Technical Environment & Setup
To run the included scripts, you will need a standard Linux distribution (I used Ubuntu 22.04 during testing).

## Required Software:
The MySQL Server: Necessary for the inspector and auditor scripts to find active directories.

Gawk & Coreutils: Standard tools used for data filtering and file analysis.

Bash Shell: Version 4.0 or higher is recommended.

Installation Note: Please ensure mysql-server is active on your system. You can typically install this via your package manager (e.g., apt or yum).

## The Script Suite
I wrote these five scripts to cover different aspects of system administration and the open-source philosophy.

-System Identity (script1_system_identity.sh): I designed this to serve as a "dashboard." It pulls the OS version, kernel details, and current user info to confirm the environment is ready for auditing.

-FOSS Inspector (script2_package_inspector.sh): This was a challenge to write because I wanted it to work on both Debian and RPM systems. It checks if MySQL exists and then prints a short reflection on why its licensing matters.

-Disk & Permission Auditor (script3_disk_permission_auditor.sh): This script automates the tedious task of checking directory sizes. It specifically targets /etc/mysql to ensure the configuration files have the correct security permissions.

-Log Analyzer (script4_log_analyzer.sh): A practical tool that scans system logs for specific keywords (like "error"). I included a retry loop here to make the script more robust if a file is temporarily locked or empty.

-Manifesto Builder (script5_manifesto_generator.sh): My favorite part of the project. It’s an interactive script that takes your personal thoughts on software freedom and generates a unique .txt manifesto file.

## Execution Guide
- Once you have the files in your local directory, follow these steps to use them:

-Enable Execution: You must grant the scripts permission to run using the change-mode command (chmod +x).

-Run Locally: Execute each script using the dot-slash notation (e.g., ./name_of_script.sh).

-Log Analysis: When using Script 4, remember to provide the path to the log file you want to scan as the first argument.

## Troubleshooting Common Issues
Permissions: If you see a "Permission Denied" error, double-check that you performed Step 1 in the execution guide.

Missing Directories: If Script 3 reports that a folder is missing, it usually means the MySQL server package hasn't been fully initialized yet.

Line Endings: If you moved these files from a Windows machine to a Linux server, you might see \r errors. Using a tool like dos2unix or a simple sed string-replacement will fix the formatting.

## Project License
This audit and the accompanying scripts are released for educational purposes. They follow the spirit of the GPL v2, encouraging others to learn, modify, and share the code.
