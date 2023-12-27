#!/bin/bash

# 文件路径
path="/home/zhanziyuan/python_assignments/yaml/Hansen/ORR_thermo_opt_solve/"

# 指定要创建的文件名的前缀
prefix="Hansen_voltage_"

# 指定文件扩展名
extension=".yaml"

# 循环创建文件
for ((i=1; i<=15; i++)); do

    # 使用 printf 来生成文件名，%02d 表示使用两位数字，例如：01、02、03
    filename=$(printf "${path}${prefix}%02d${extension}" $i)

    # 创建文件并添加执行权限
    touch "$filename"

    # 可选：如果需要在文件中添加脚本内容，可以使用以下行
    # echo "#!/bin/bash" > "$filename"
    # echo "echo 'This is cat $i'" >> "$filename"

    n=$(printf "%02d" $i)

    # 打印循环计数，输出ASCII字符方框
    echo "+------------------------+"
    echo "|                        |"
    echo "  File No. ${n} created.  "
    echo "|                        |"
    echo "+------------------------+"

done

echo "+------------------------+"
echo "|                        |"
echo "  All files are created.  "
echo "|                        |"
echo "+------------------------+"
