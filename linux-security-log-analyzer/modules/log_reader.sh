#!/bin/bash

read_auth_logs(){
local log_file="$1"

if [[ ! -f "$log_file" ]]; then
echo "[ERROR] Authentication log file not found."
return 1;
fi

if [[ ! -r "$log_file" ]]; then
echo "[ERROR] Cannot red authentication log."
return 1
fi

cat "$log_file"
}
