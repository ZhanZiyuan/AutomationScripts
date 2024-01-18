#!/bin/bash

# Please refer to:
# https://xstarcd.github.io/wiki/shell/shell_special_variables.html
# https://developer.aliyun.com/article/530776

# Check if at least one parameter is passed
if [ "$#" -eq 0 ]; then
    echo "Please pass at least one PID as a valid parameter."
    exit 1
fi

# Array to store PIDs of killed processes
terminated_pids=()

# Process each passed PID in a loop
for pid in "$@"; do
    # Check if the passed PID exists
    if ps -p "$pid" > /dev/null; then
        # Kill the process
        printf "Killing process of PID: $pid\n"
        kill -9 "$pid"
        # Add the PID of the killed process to the array
        terminated_pids+=("$pid")
    else
        printf "Process of PID: $pid does not exist.\n"
    fi
done

# Print PIDs of killed processes
if [ ${#terminated_pids[@]} -eq 0 ]; then
    echo "No processes were killed."
else
    printf "Process(es) of PID(s): ${terminated_pids[*]} killed.\n"
fi


