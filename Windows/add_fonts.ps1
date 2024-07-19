# 指定Windows目录下的字体文件夹路径
$fontFolderPath = "C:\Users\user\Downloads\Noto_Sans_JP\static"

# 获取目录下所有.ttf文件
$fontFiles = Get-ChildItem -Path $fontFolderPath -Filter *.ttf

# 安装每个字体文件
foreach ($fontFile in $fontFiles) {
    Write-Host "Installing font: $($fontFile.Name)"
    Add-Font -LiteralPath $fontFile.FullName
}

Write-Host "Font installation completed."
