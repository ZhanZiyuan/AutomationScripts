# Import modules
#
# Please refer to:
# https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.core/about/about_special_characters?view=powershell-7.4
# https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.4
# https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-7.4
# https://learn.microsoft.com/zh-cn/powershell/scripting/learn/deep-dives/everything-about-if?view=powershell-7.4
# https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.core/about/about_pipeline_chain_operators?view=powershell-7.4
# https://learn.microsoft.com/zh-cn/powershell/scripting/learn/ps101/04-pipelines?view=powershell-7.4


if ($PSVersionTable.PSVersion.Major -ge 5) {
    Import-Module PoshColor
    Import-Module PowerShellAI
    Import-Module Terminal-Icons
}
else {
    Write-Output "Unsupported PowerShell version."
}
