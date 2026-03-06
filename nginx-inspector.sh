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

function top_ip() {
echo
echo "Top 10 IP Addresses"
awk '{print $1}' "$LOGFILE" | sort | uniq -c | sort -nr | head -10
echo
}

function top_url() {
echo
echo "Top 10 Requested URLs"
awk '{print $7}' "$LOGFILE" | sort | uniq -c | sort -nr | head -10
echo
}

function status_codes() {
echo
echo "Top Status Codes"
awk '{print $9}' "$LOGFILE" | sort | uniq -c | sort -nr | head -10
echo
}

function user_agents() {
echo
echo "Top User Agents"
awk -F\" '{print $6}' "$LOGFILE" | sort | uniq -c | sort -nr | head -10
echo
}

function error_404() {
echo
echo "Top 404 Errors"
awk '$9 == 404 {print $7}' "$LOGFILE" | sort | uniq -c | sort -nr | head
echo
}

function suspicious_ip() {
echo
echo "Suspicious IPs (>500 requests)"
awk '{print $1}' "$LOGFILE" | sort | uniq -c | awk '$1 > 500'
echo
}

function bandwidth() {
echo
echo "Total Bandwidth Used"
awk '{sum += $10} END {print sum/1024/1024 " MB"}' "$LOGFILE"
echo
}

function sql_injection() {
echo
echo "Possible SQL Injection Attempts"
grep -i "union\|select\|insert\|drop\|update" "$LOGFILE" | wc -l
echo
}

function xss_attack() {
echo
echo "Possible XSS Attempts"
grep -i "<script>" "$LOGFILE" | wc -l
echo
}

function bot_requests() {
echo
echo "Bot Requests"
grep -i "bot" "$LOGFILE" | wc -l
echo
}

while true
do
echo "=============================="
echo "   NGINX LOG ANALYZER"
echo "   Author: shuvo-halder"
echo "=============================="

echo "1. Top IP Analysis"
echo "2. Top URL Analysis"
echo "3. Status Code Analysis"
echo "4. User Agent Analysis"
echo "5. 404 Error Report"
echo "6. Suspicious IP Detection"
echo "7. Bandwidth Usage"
echo "8. SQL Injection Detection"
echo "9. XSS Detection"
echo "10. Bot Detection"
echo "0. Exit"

echo
read -p "Enter your choice: " choice

case $choice in
1) top_ip ;;
2) top_url ;;
3) status_codes ;;
4) user_agents ;;
5) error_404 ;;
6) suspicious_ip ;;
7) bandwidth ;;
8) sql_injection ;;
9) xss_attack ;;
10) bot_requests ;;
0) exit ;;
*) echo "Invalid option" ;;
esac

read -p "Press enter to continue..."

done
