#!/bin/bash

# The Python version required to execute the script
PYTHON="python3"

# file path of the Python script to run
python_path="/home/zhanziyuan/python_assignments/yaml/conformation/conformation_eq_tree/conformation_eq_tree_run/"

# file path of the log file
log_path="/home/zhanziyuan/python_assignments/yaml/conformation/conformation_eq_tree/conformation_eq_tree_exports/"

# prefix of the Python script
python_prefix="conformation_eq_tree_pea_"

# prefix of the log file
log_prefix="conformation_eq_tree_pea_"

# extension name of the Python script
python_extension=".py"

# extension name of the log file
log_extension=".log"

# loop
for ((i=1; i<=11; i++)); do

    # use `printf` to create a new file name; 
    python_filename=$(printf "${python_path}${python_prefix}%02d${python_extension}" $i)
    log_filename=$(printf "${log_path}${log_prefix}%02d${log_extension}" $i)

    nohup python "$python_filename" > "$log_filename" 2>&1 &

    n=$(printf "%02d" $i)

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
