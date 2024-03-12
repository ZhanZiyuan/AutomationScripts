#!/bin/bash

#SBATCH --partition=S01
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --job-name=python_job
#SBATCH --nodelist=node8
#SBATCH --output=python_job.%j.out


# file path of the Python script to run
python_file_path=$1

# file path of the log file
log_file_path=$2

# run the Python script; redirect the output to a .log file
python "$python_file_path" > "$log_file_path" 2>&1

# print a prompt
printf "Python task submitted. PID: $!\n"


# An example of running this batch script:
#
# Please refer to:
# - [sbatch](https://hpc.pku.edu.cn/_book/guide/slurm/sbatch.html)
# - [special variables of shell](https://xstarcd.github.io/wiki/shell/shell_special_variables.html)
#
# This batch script always runs on node8:
#
# sbatch run_python_batch.sh test_01.py output_01.log
