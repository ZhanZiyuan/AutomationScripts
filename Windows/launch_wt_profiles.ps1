# Launch Windows Terminal Profiles
#
# Please refer to:
# https://learn.microsoft.com/zh-cn/windows/terminal/command-line-arguments?tabs=powershell


wt.exe `
    new-tab `
        --profile "Windows PowerShell" `
        --startingDirectory "C:\Users\user\Downloads" `
        --tabColor "#1f86eb" `; `
    new-tab `
        --profile "PowerShell" `
        --startingDirectory "C:\Users\user\Downloads" `
        --tabColor "#437aa8" `; `
    new-tab `
        --profile group_name `
        --title "(base) 3.8" --suppressApplicationTitle `
        --tabColor "#b7177d" `; `
    new-tab `
        --profile group_name `
        --title "(base) 3.11" --suppressApplicationTitle `
        --tabColor "#6455be" `; `
    new-tab `
        --profile group_name `
        --title "top - 3.10" --suppressApplicationTitle `
        --tabColor "#8a2be2" `; `
