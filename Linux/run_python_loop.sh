#!/bin/bash

# The Python version required to execute the script
PYTHON="python3"

# file path of the Python script to run
python_path="/home/zhanziyuan/python_assignments/yaml/pea_input/"

# file path of the log file
log_path="/home/zhanziyuan/python_assignments/yaml/pea_input/output_log/random_output/"

# prefix of the Python script
python_prefix="monomer_excimer_pea_random_01"

# prefix of the log file
log_prefix="monomer_excimer_pea_random_01_"

# extension name of the Python script
python_extension=".py"

# extension name of the log file
log_extension=".log"

# loop
for ((i=1; i<=20; i++)); do

    # use `printf` to create a new file name; 
    python_filename=$(printf "%s%s%s" "$python_path" "$python_prefix" "$python_extension")
    log_filename=$(printf "${log_path}${log_prefix}%03d${log_extension}" $i)

    nohup python "$python_filename" > "$log_filename" 2>&1 &

    n=$(printf "%03d" $i)

    # print the loop count
    echo "+------------------+"
    echo "|                  |"
    echo "  Running No. ${n}  "
    echo "|                  |"
    echo "+------------------+"

done

echo "+-----------------------------+"
echo "|                             |"
echo "| All Python tasks submitted. |"
echo "|                             |"
echo "+-----------------------------+"
