#!/bin/bash

# file path of the file to be moved
old_path="/home/zhanziyuan/python_assignments/yaml/conformation/conformation_eq_tree/conformation_eq_tree_run/"

# file path of the file moved
new_path="/home/zhanziyuan/python_assignments/yaml/conformation/conformation_eq_tree/conformation_eq_tree_run/"

# original prefix of the file name 
old_prefix="conformation_eq_pea_"

# modified prefix of the file name 
new_prefix="conformation_eq_tree_pea_"

# original extension of the file name 
old_extension=".py"

# modified extension of the file name 
new_extension=".py"

# loop
for ((i=1; i<=11; i++)); do

    # use `printf` to create a new file name; 
    # `%02d` means "format the integer with 2 digits, left padding it with zeroes"
    old_filename=$(printf "${old_path}${old_prefix}%02d${old_extension}" $i)
    new_filename=$(printf "${new_path}${new_prefix}%02d${new_extension}" $i)

    mv "$old_filename" "$new_filename"

    n=$(printf "%02d" $i)

    # print the loop count
    echo "+----------------------+"
    echo "|                      |"
    echo "  File No. ${n} moved.  "
    echo "|                      |"
    echo "+----------------------+"

done

echo "+----------------------+"
echo "|                      |"
echo "  All files are moved.  "
echo "|                      |"
echo "+----------------------+"
