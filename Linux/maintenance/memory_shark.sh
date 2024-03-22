#!/bin/bash


# Examples of usage:
#
# ./memory_shark.sh -u zhanziyuan -t 180 -m 20
#
# nohup ./memory_shark.sh > shark_killed.log 2>&1 &
#
# nohup ./memory_shark.sh -t 180 -m 20 -u zhanziyuan > shark_killed.log 2>&1 &


function show_help() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -t, --time      Set the sleep time in seconds (default: 120)."
    echo "  -u, --user      Set the username to monitor (default: zhanziyuan)."
    echo "  -m, --memory    Set the memory limit in GB (default: 40)."
    echo "  -h, --help      Display this help message and exit."
}

function check_memory_usage() {
    local username="$1"
    local sleep_time="$2"
    local mem_limit="$3"

    while true; do
        # Get PID and memory usage of all processes for the specified user
        local pid_mem=$(ps -u "$username" -o pid,%mem,comm --no-headers | sort -k2 -nr)
        local total_mem=0
        
        # Calculate total memory usage
        while read -r pid mem comm; do
            total_mem=$(awk "BEGIN {print $total_mem + $mem}")
        done <<< "$pid_mem"
        
        # Check if memory usage exceeds the limit
        if (( $(echo "$total_mem > $mem_limit" | bc -l) )); then
            # Find and terminate the process with the highest memory usage
            local max_mem_pid=$(echo "$pid_mem" | head -n 1 | awk '{print $1}')
            local max_mem_comm=$(echo "$pid_mem" | head -n 1 | awk '{print $3}')
            printf "User %s has exceeded memory limit. Terminating process with PID %s (%s)\n" "$username" "$max_mem_pid" "$max_mem_comm"
            kill -9 "$max_mem_pid"
        fi
        
        # Wait for the specified number of seconds before checking again
        sleep "$sleep_time"
    done
}

# Default parameters
username="zhanziyuan"
sleep_time=120 # Default sleep time is 120 seconds
mem_limit=40   # Default memory limit is 40 GB

# Parameter parsing
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -t|--time) sleep_time="$2"; shift ;;
        -u|--user) username="$2"; shift ;;
        -m|--memory) mem_limit="$2"; shift ;;
        -h|--help) show_help; exit 0 ;;
        *) echo "Unknown parameter passed: $1"; show_help; exit 1 ;;
    esac
    shift
done

check_memory_usage "$username" "$sleep_time" "$mem_limit"
