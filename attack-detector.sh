#!/bin/bash

LOGFILE="$1"

if [[ -z "$LOGFILE" ]]; then
  echo "Usage: $0 <nginx_access_log>"
  exit 1
fi

if [[ ! -f "$LOGFILE" ]]; then
  echo "Log file not found!"
  exit 1
fi

echo "=============================="
echo " NGINX ATTACK DETECTOR"
echo "=============================="
echo

echo "SQL Injection Attempts:"
grep -Ei "union|select|insert|drop|update|or 1=1" "$LOGFILE" | wc -l
echo

echo "XSS Attempts:"
grep -Ei "<script>|%3Cscript%3E" "$LOGFILE" | wc -l
echo

echo "Directory Traversal Attempts:"
grep -E "\.\./" "$LOGFILE" | wc -l
echo

echo "Command Injection Attempts:"
grep -Ei "cmd=|;|&&|\|" "$LOGFILE" | wc -l
echo

echo "Suspicious Scanner Tools:"
grep -Ei "nikto|sqlmap|nmap|acunetix|wpscan" "$LOGFILE" | wc -l
echo

echo "Top Suspicious IPs (>200 requests):"
awk '{print $1}' "$LOGFILE" | sort | uniq -c | awk '$1 > 200' | sort -nr | head
echo

echo "Possible Login Brute Force:"
grep -Ei "/login|/admin" "$LOGFILE" | awk '{print $1}' | sort | uniq -c | sort -nr | head
echo

echo "Attack Detection Complete"
