#!/bin/bash

# Please refer to:
# https://xstarcd.github.io/wiki/shell/shell_special_variables.html
# https://developer.aliyun.com/article/530776
# 
# Examples of usage:
# ./kill_by_name.sh "/home/zhanziyuan/.vscode-server"

# Check if at least one parameter is passed
if [ $# -eq 0 ]; then
    echo "Please pass at least one string as a valid parameter."
    exit 1
fi

# The specified string in the command
command_keywords=$1

# Array to store PIDs of killed processes
terminated_pids=()

# Include PIDs of processes containing the specified string in the command in a list
process_pids=$(ps aux | grep "$command_keywords" | grep -v grep | grep -v "$0" | awk '{print $2}')

# Check if there are matching processes
if [ -z "$process_pids" ]; then
    printf "There are no processes containing the string '$command_keywords' in the command.\n"
else
    # Kill all matching processes
    printf "Killing processes containing the string '$command_keywords' in the command...\n"
    for pid in $process_pids; do
        # Kill the process
        printf "Killing process of PID: $pid\n"
        kill -9 "$pid"
        # Add the PID of the killed process to the array
        terminated_pids+=("$pid")
    done
fi

# Print PIDs of killed processes
if [ ${#terminated_pids[@]} -eq 0 ]; then
    echo "No processes were killed."
else
    printf "Process(es) of PID(s): ${terminated_pids[*]} killed.\n"
fi

