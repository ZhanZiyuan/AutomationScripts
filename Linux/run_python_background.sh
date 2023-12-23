#!/bin/bash

# python file name
python_file_path="/home/zhanziyuan/python_assignments/yaml/Hansen/ORR_thermo_opt_solve/"

python_file_prefix="qssa_multi_opt_TOF_13_"

python_file_extension=".py"

# log file name
log_file_path="/home/zhanziyuan/python_assignments/yaml/Hansen/ORR_thermo_opt_solve/coverage_vs_voltage/"

log_file_prefix="coverage_16_voltage_"

log_file_extension=".log"

# loop
for ((i=8; i<=15; i++)); do

    # use `printf` to create a new file name; 
    # `%02d` means "format the integer with 2 digits, left padding it with zeroes"
    python_filename=$(printf "${python_file_path}${python_file_prefix}%02d${python_file_extension}" $i)
    log_filename=$(printf "${log_file_path}${log_file_prefix}%02d${log_file_extension}" $i)

    nohup python "$python_filename" > "$log_filename" 2>&1 &

    n=$(printf "%02d" $i)

    # print the loop count
    echo "+---------------------------+"
    echo "|                           |"
    echo "  File No. ${n} is running.  "
    echo "|                           |"
    echo "+---------------------------+"

done

echo "+------------------------+"
echo "|                        |"
echo "  All files are running.  "
echo "|                        |"
echo "+------------------------+"
