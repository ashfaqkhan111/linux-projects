#!/bin/bash

generate_security_report() {

    local log_file="$1"
    local threshold="$2"
    local report_dir="$3"

    # Check whether the log file exists
    if [[ ! -f "$log_file" ]]; then
        echo "[ERROR] Log file not found." >&2
        return 1
    fi

    # Create report directory if it does not exist
    mkdir -p "$report_dir"

    # Generate report filename
    local timestamp
    timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

    local report_file="$report_dir/security_report_$timestamp.txt"

    # Write analysis results into the report
    {

        echo "=========================================="
        echo "       LINUX SECURITY LOG ANALYZER"
        echo "=========================================="
        echo "Report generated: $(date)"
        echo "Analyzed log: $log_file"
        echo "Brute-force threshold: $threshold"
        echo

        echo "========== FAILED LOGIN SUMMARY =========="
        source modules/failed_login.sh
        count_failed_logins "$log_file"
        echo

        echo "========== FAILED LOGIN IP ANALYSIS ======"
        source modules/ip_analyzer.sh
        analyze_failed_login_ips "$log_file"
        echo

        echo "========== BRUTE-FORCE ALERTS ============="
        source modules/threat_detector.sh
        detect_brute_force "$log_file" "$threshold"
        echo

        echo "========== SUCCESSFUL LOGIN SUMMARY ======"
        source modules/successful_login.sh
        count_successful_logins "$log_file"
        echo

        echo "========== SUCCESSFUL LOGIN RECORDS ======"
        display_successful_logins "$log_file"
        echo

        echo "=====END OF REPORT====="

    } > "$report_file"

    echo "[SUCCESS] Security report generated: $report_file"
}
