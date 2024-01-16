#!/bin/bash

#SBATCH -p S01
#SBATCH -N 1

export GMS=$HOME/gamess/rungms
# alias gms=$HOME/gamess/rungms
# alias xeda=$HOME/gamess/rungms

INP=$1
CORE=$2
INDEX=${1%%.*}

$HOME/gamess/rungms $INP 00 $CORE > ${INDEX}.gms


# An example of running this shell script:
#
# Please refer to:
# - [a tutorial of the compilation of GAMESS](https://mp.weixin.qq.com/s/SF5BEfKsGwdKSlZdAe1t4A)
# - [a tutorial of GKS-EDA](https://mp.weixin.qq.com/s/6nuJpYJdNbUJndrYM13Fog)
# - [a tutorial of the compilation of GAMESS](https://cloud.tencent.com/developer/article/1883504)
# - [a tutorial of GKS-EDA](https://cloud.tencent.com/developer/article/2005090)
#
# 1. runs on one node: node8
# 2. number of processes: 4
# 3. job name: test
# 4. input file: test.inp
# 5. number of CPU cores allocated to GAMESS: 4
#
# sbatch -N 1 -n 4 -w node8 -J test run_xeda.sh test.inp 4
