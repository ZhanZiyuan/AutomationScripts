#!/bin/bash

# 执行脚本需要的Python版本
PYTHON="python3"

# 循环运行Python文件100次
for ((i=1; i<=20; i++))
do
    # 打印循环计数，输出ASCII字符方框
    echo "+------------------------------+"
    echo "|                              |"
    echo "     This is loop No. ${i}.     "
    echo "|                              |"
    echo "+------------------------------+"

    # 运行文件qssa_multi_opt_08_test.py，生成文件sol_ivp.npz
    python /home/zhanziyuan/python_assignments/2023.03/solve_rate_func/solveratefunc08_objcalc_test02.py

    # 构建新的文件名
    new_filename=$(printf "/home/zhanziyuan/python_assignments/yaml/ode_ivp_log/sol_ivp_%03d.npz" "${i}")

    # 重命名文件为新的文件名
    mv "/home/zhanziyuan/python_assignments/yaml/ode_ivp_log/sol_ivp.npz" "${new_filename}"
done


