# The Open Source Audit — MySQL 8.0
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

## About MySQL

MySQL is an open-source relational database management system originally created by Michael Widenius (Monty) and David Axmark in Sweden in 1995. It was named after Monty's daughter "My". MySQL became one of the most widely used databases in the world and forms the "M" in the famous LAMP stack (Linux, Apache, MySQL, PHP). It is released under the GPL v2 license for community use and a commercial license for proprietary embedding.

---

## Repository Contents

```
├── script1_system_identity.sh       # System Identity Report
├── script2_package_inspector.sh     # FOSS Package Inspector
├── script3_disk_permission_auditor.sh  # Disk and Permission Auditor
├── script4_log_analyzer.sh          # Log File Analyzer
├── script5_manifesto_generator.sh   # Open Source Manifesto Generator
└── README.md                        # This file
```

---

## Script Descriptions

### Script 1 — System Identity Report
This script acts as a welcome screen for the Linux system. It collects and displays key system information including the Linux distribution name, kernel version, currently logged-in user, home directory, system uptime, and current date and time. It also prints a message about the open-source license that covers the operating system.

**Concepts used:** Variables, echo, command substitution `$()`, basic output formatting, reading from `/etc/os-release`

---

### Script 2 — FOSS Package Inspector
This script checks whether MySQL is installed on the Linux system. It automatically detects whether the system is RPM-based (Fedora, RHEL) or Debian-based (Ubuntu) and uses the appropriate package manager to check installation status. If installed, it displays the version, homepage, and description of the package. A case statement then prints a short open-source philosophy note about MySQL.

**Concepts used:** if-then-else, case statement, `dpkg`/`rpm` commands, pipe with `grep`, command detection with `command -v`

---

### Script 3 — Disk and Permission Auditor
This script loops through a list of five important Linux system directories and reports how much disk space each one uses along with its owner and permissions. It also specifically checks whether MySQL's configuration directory (`/etc/mysql`) exists and prints its permissions and contents.

**Concepts used:** for loop, arrays, `if [ -d ]` directory check, `ls -ld`, `awk` field extraction, `du -sh`, error suppression with `2>/dev/null`

---

### Script 4 — Log File Analyzer
This script reads a log file line by line and counts how many lines contain a specified keyword. It accepts the log file path and keyword as command-line arguments (with "error" as the default keyword). It includes a do-while style retry loop that handles empty files and prints the last 5 matching lines at the end using `grep` and `tail`.

**Concepts used:** Command-line arguments `$1`/`$2`, while read loop, if-then inside loop, counter variable, do-while pattern using `while true`, `grep -iq`, `tail`, pipe operators

---

### Script 5 — Open Source Manifesto Generator
This is an interactive script that asks the user three questions and then generates a personalised open-source philosophy statement based on their answers. The output is saved to a `.txt` file named after the current user and then displayed on screen using `cat`.

**Concepts used:** `read -p` interactive input, string variables, `>` and `>>` file writing, `date` command formatting, `{}` command grouping, `cat` to display output, alias concept demonstrated via comment

---

## Dependencies

Before running the scripts, make sure the following are installed on your Linux system:

| Dependency | Purpose | Install Command |
|---|---|---|
| `bash` | Shell to run the scripts | Pre-installed on all Linux systems |
| `mysql-server` | Required for Script 2 and 3 | `sudo apt install mysql-server -y` |
| `gawk` | Text processing in Script 3 | `sudo apt install gawk -y` |
| `coreutils` | Basic commands (du, ls, cut) | Pre-installed on all Linux systems |
| `grep` | Pattern matching in Script 4 | Pre-installed on all Linux systems |

---

## Step-by-Step Instructions To Run On Linux

### Prerequisites
- A Linux system (Ubuntu 20.04 / 22.04 recommended) or WSL on Windows
- Bash shell (version 4.0 or higher)
- MySQL installed (for Scripts 2 and 3)

---

### Step 1 — Clone The Repository
```bash
git clone https://github.com/yourusername/open-source-audit.git
cd open-source-audit
```
Or if you downloaded the files manually, navigate to the folder:
```bash
cd ~/Downloads/open-source-audit
```

---

### Step 2 — Make All Scripts Executable
```bash
chmod +x script*.sh
```

---

### Step 3 — Install MySQL (Required for Scripts 2 and 3)
```bash
sudo apt update
sudo apt install mysql-server -y
```
Verify installation:
```bash
mysql --version
```

---

### Step 4 — Run Each Script

#### Script 1 — System Identity Report
```bash
./script1_system_identity.sh
```
**Expected output:** Displays distribution name, kernel version, logged-in user, home directory, uptime, date/time, and license information.

---

#### Script 2 — FOSS Package Inspector
```bash
./script2_package_inspector.sh
```
**Expected output:** Shows whether mysql-server is installed, its version and description, and prints an open-source philosophy note.

---

#### Script 3 — Disk and Permission Auditor
```bash
./script3_disk_permission_auditor.sh
```
**Expected output:** Lists permissions and sizes of /etc, /var/log, /home, /usr/bin, /tmp and checks the /etc/mysql config directory.

---

#### Script 4 — Log File Analyzer
The script requires a log file path as the first argument and an optional keyword as the second argument (default is "error").

**Using a real system log:**
```bash
./script4_log_analyzer.sh /var/log/syslog error
```

**Using a test log file (if syslog is not available):**
First create a test log:
```bash
echo "error connecting to database" > /tmp/test.log
echo "warning low memory" >> /tmp/test.log
echo "error timeout reached" >> /tmp/test.log
echo "info service started" >> /tmp/test.log
echo "error disk full" >> /tmp/test.log
```
Then run:
```bash
./script4_log_analyzer.sh /tmp/test.log error
```
**Expected output:** Count of lines containing the keyword and the last 5 matching lines.

---

#### Script 5 — Open Source Manifesto Generator
```bash
./script5_manifesto_generator.sh
```
The script will ask three interactive questions:
```
1. Name one open-source tool you use every day:
2. In one word, what does 'freedom' mean to you?
3. Name one thing you would build and share freely:
```
Type your answers and press Enter after each one.

**Expected output:** A personalised manifesto saved to `manifesto_<yourusername>.txt` and displayed on screen.

---

### Step 5 — Fix Windows Line Endings (If Copied From Windows)
If you edited the scripts on Windows and copied them to Linux, run this to fix any line ending issues:
```bash
sed -i 's/\r//' ~/script*.sh
```

---

## Troubleshooting

| Problem | Solution |
|---|---|
| `Permission denied` | Run `chmod +x script*.sh` |
| `No such file or directory` | Check you are in the right folder with `ls` |
| Script 2 shows NOT INSTALLED | Run `sudo apt install mysql-server -y` |
| Script 3 config dir not found | MySQL may not be installed — install it first |
| Script 4 log file not found | Use `/tmp/test.log` method described above |
| Scripts have `\r` errors | Run `sed -i 's/\r//' script*.sh` |

---

## License

These shell scripts were written as part of an academic  on Open Source Software. They are intended for educational use.

---

## References

- MySQL Official Documentation — dev.mysql.com/doc
- GNU General Public License v2 — gnu.org/licenses/gpl-2.0.html
- The Linux Command Line, William Shotts — linuxcommand.org
- GNU Bash Manual — gnu.org/software/bash/manual
