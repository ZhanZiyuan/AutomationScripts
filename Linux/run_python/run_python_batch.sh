#!/bin/bash

#SBATCH --partition=S01
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --job-name=python_job
#SBATCH --nodelist=node8


# file path of the Python script to run
python_file_path=$1

# file path of the log file
log_file_path=$2

# run the Python script; redirect the output to a .log file
python "$python_file_path" > "$log_file_path" 2>&1


# Usage
#
# Please refer to:
# - [sbatch](https://hpc.pku.edu.cn/_book/guide/slurm/sbatch.html)
# - [special variables of shell](https://xstarcd.github.io/wiki/shell/shell_special_variables.html)
# - [Slurm job scheduling system](https://docs.hpc.sjtu.edu.cn/job/slurm.html)
#
# An example of running this batch script:
#
# sbatch run_python_batch.sh test_01.py output_01.log
# 
# ATTENTION: computational tasks submitted by this batch script always runs on node8.
