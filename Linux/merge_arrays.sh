#!/bin/bash

# 执行脚本需要的Python版本
PYTHON="python3"

# 创建一个空的 NumPy 数组用于存储提取出的数据
merged_array=()

# 循环遍历文件
for i in {1..20}; do
    # 构建文件名
    filename="save_array_$(printf "%02d" "${i}").npz"

    # 使用 NpzReader 类提取 arr_01 数据
    arr_01=$(python -c "
import numpy as np
from NpzReader import NpzReader

reader = NpzReader('$filename')
arr_01 = reader.get_data('arr_01')
print(arr_01.tolist())
    ")

    # 将提取的数据追加到合并数组中
    merged_array+=($arr_01)
done

# 打印合并后的数组
echo "${merged_array[@]}"
