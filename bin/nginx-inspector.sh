#!/bin/bash
LOGFILE="$1"
if [[ -z "$LOGFILE" ]]; then
  echo "Usage: nginx-inspector.sh <logfile>"
  exit 1
fi

while true
do
  echo "========= NGINX INSPECTOR ========="
  echo "1. Top IP Analysis"
  echo "2. Top URL Analysis"
  echo "3. Status Code Analysis"
  echo "4. Run Attack Detection"
  echo "5. Real-time Monitor"
  echo "6. Generate JSON Report"
  echo "0. Exit"

  read -p "Enter option: " option

  case $option in
    1)
      awk '{print $1}' $LOGFILE | sort | uniq -c | sort -nr | head
      ;;
    2)
      awk '{print $7}' $LOGFILE | sort | uniq -c | sort -nr | head
      ;;
    3)
      awk '{print $9}' $LOGFILE | sort | uniq -c | sort -nr
      ;;
    4)
      bash attack-detector.sh $LOGFILE
      ;;
    5)
      bash realtime-monitor.sh $LOGFILE
      ;;
    6)
      bash json-report.sh $LOGFILE
      ;;
    0)
      exit
      ;;
    *)
      echo "Invalid option"
      ;;
  esac
done