# https://blog.simontimms.com/2021/06/11/installing-fonts/

# 输出提示信息
echo "Install fonts"

# 获取 Shell.Application COM 对象，用于处理文件和文件夹
$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)

# 遍历当前目录下的所有.ttf文件
foreach ($file in gci *.ttf)
{
    # 获取文件名
    $fileName = $file.Name

    # 检查是否已存在于"C:\Windows\fonts\"目录中
    if (-not(Test-Path -Path "C:\Windows\fonts\$fileName" )) {
        # 输出文件名
        echo $fileName

        # 使用 Shell.Application 对象复制文件到字体目录
        dir $file | %{ $fonts.CopyHere($_.fullname) }
    }
}

# 复制所有.ttf文件到"C:\Windows\fonts\"目录中
cp *.ttf c:\windows\fonts\
