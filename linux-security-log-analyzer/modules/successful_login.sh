#!/bin/bash

count_successful_logins() {
local log_file="$1"

if [[ ! -f "$log_file" ]]; then
echo "[ERROR] Log file not found." >&2
return 1
fi

grep -c "Accepted password" "$log_file"
}

display_successful_logins() {
local log_file="$1"

if [[ ! -f  "$log_file" ]]; then
echo "[ERROR] Log file not found." >&2
return 1
fi

grep "Accepted password" "$log_file"
}
