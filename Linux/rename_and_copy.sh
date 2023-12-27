#!/bin/bash

# the original file name 
old_filename="/home/zhanziyuan/python_assignments/yaml/conformation/conformation_eq_run/conformation_eq_03.py"

# file path of the file copied
new_path="/home/zhanziyuan/python_assignments/yaml/conformation/conformation_eq_run/"

# modified prefix of the file name 
new_prefix="conformation_eq_"

# modified extension of the file name 
new_extension=".py"

# loop
for i in {1..11}; do

    new_filename=$(printf "${new_path}${new_prefix}%02d${new_extension}" $i)

    cp "$old_filename" "$new_filename"

    n=$(printf "%02d" $i)

    # print the loop count
    echo "+-----------------------+"
    echo "|                       |"
    echo "  File No. ${n} copied.  "
    echo "|                       |"
    echo "+-----------------------+"

done

echo "+-----------------------+"
echo "|                       |"
echo "  All files are copied.  "
echo "|                       |"
echo "+-----------------------+"
