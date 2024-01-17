#!/bin/bash

python_file_path=$1
log_file_path=$2

nohup python "$python_file_path" > "$log_file_path" 2>&1 &

printf "Python task submitted. PID: $!\n"
