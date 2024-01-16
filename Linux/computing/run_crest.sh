#!/bin/bash

#SBATCH -p S01
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --cpus-per-task=8
#SBATCH -J run_crest_job
#SBATCH -o crest_job.%j.out

export PATH=$PATH:/home/$USER/bin/crest

"$@"


# An example of running this shell script:
#
# Please refer to:
# - [sbatch](https://hpc.pku.edu.cn/_book/guide/slurm/sbatch.html)
# - [Example 1](https://crest-lab.github.io/crest-docs/page/examples/example_1.html)
#
# 1. runs on one node: node4
#
# sbatch -w node4 run_crest.sh crest struc.xyz --gfn2 --gbsa h2o -T 4 > crest.log
#
# You can replace the command at the end:
# `crest struc.xyz --gfn2 --gbsa h2o -T 4 > crest.log`
# with whatever CREST command you like.
