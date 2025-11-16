#!/bin/bash

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

LOGFILE="/var/log/system_health.log"

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
mem_usage=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')
disk_usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "CPU: $cpu_usage%, MEM: $mem_usage%, DISK: $disk_usage%" >> "$LOGFILE"

if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
  echo "CPU usage high: $cpu_usage%" >> "$LOGFILE"
fi

if (( mem_usage > MEM_THRESHOLD )); then
  echo "Memory usage high: $mem_usage%" >> "$LOGFILE"
fi

if (( disk_usage > DISK_THRESHOLD )); then
  echo "Disk usage high: $disk_usage%" >> "$LOGFILE"
fi
