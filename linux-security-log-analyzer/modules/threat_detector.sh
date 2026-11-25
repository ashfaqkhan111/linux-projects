#!/bin/bash

detect_brute_force() {
local log_file="$1"
local threshold="$2"

if [[ ! -f "$log_file" ]]; then
echo "[ERROR] Log file not found." >&2
return 1
fi

if [[ ! "$threshold" =~ ^[0-9]+$ ]] || (( threshold < 1 )); then
echo "[ERROR} Invalid threshold." >&2
return 1
fi

grep "Failed password" "$log_file" | awk '{print $(NF-3)}' | sort | uniq -c | while read -r count ip; do

if (( count >= threshold )); then
echo "[ALERT] Possible brute-forece activity for $ip ($count failed attempts)"
fi
done
}
