#!/bin/bash

analyze_failed_login_ips() {
local log_file="$1"

if [[ ! -f "$log_file" ]]; then
echo "[ERROR] Log file not found." >&2
return 1
fi

grep "Failed password" "$log_file" | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr
}
