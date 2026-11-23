#!/bin/bash
echo "=====System Informatoin====="
echo ""
echo "[HOSTNAME]"
hostname

echo ""
echo "[CURRENT USER]"
whoami

echo ""
echo "[SYSTEM UPTIME]"
uptime -p

echo ""
echo "[MEMORY INFORMATION]"
free -h

echo ""
echo "[DISK INFORMATION]"
df -h /

echo ""
echo "===== MONITERING COMPLETED====="
