#!/bin/bash

REPORT="reports/system_report.txt"

echo "==========================================" > $REPORT
echo "        LINUX SYSTEM HEALTH REPORT        " >> $REPORT
echo "==========================================" >> $REPORT
echo "Generated on: $(date)" >> $REPORT
echo "" >> $REPORT

# ==============================
# SYSTEM UPTIME
# ==============================

echo "📌 SYSTEM UPTIME" >> $REPORT
echo "------------------------------------------" >> $REPORT
uptime -p >> $REPORT
echo "" >> $REPORT

# ==============================
# MEMORY USAGE
# ==============================

echo "📌 MEMORY USAGE" >> $REPORT
echo "------------------------------------------" >> $REPORT
free -h >> $REPORT
echo "" >> $REPORT

# ==============================
# DISK USAGE
# ==============================

echo "📌 DISK USAGE" >> $REPORT
echo "------------------------------------------" >> $REPORT
df -h | grep '^/dev/' >> $REPORT
echo "" >> $REPORT

# ==============================
# CPU LOAD
# ==============================

echo "📌 CPU LOAD" >> $REPORT
echo "------------------------------------------" >> $REPORT
top -bn1 | grep "load average" >> $REPORT
echo "" >> $REPORT

# ==============================
# TOP MEMORY CONSUMING PROCESSES
# ==============================

echo "📌 TOP 5 MEMORY CONSUMING PROCESSES" >> $REPORT
echo "------------------------------------------" >> $REPORT
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -6 >> $REPORT
echo "" >> $REPORT

# ==============================
# ACTIVE USERS
# ==============================

echo "📌 CURRENTLY LOGGED-IN USERS" >> $REPORT
echo "------------------------------------------" >> $REPORT
who >> $REPORT
echo "" >> $REPORT

# ==============================
# NETWORK INFORMATION
# ==============================

echo "📌 NETWORK IP ADDRESS" >> $REPORT
echo "------------------------------------------" >> $REPORT
hostname -I >> $REPORT
echo "" >> $REPORT

echo "==========================================" >> $REPORT
echo "     REPORT GENERATED SUCCESSFULLY        " >> $REPORT
echo "==========================================" >> $REPORT

echo "✅ System report generated successfully!"
