# Convert backslashes to slashes
function Convert-Path {
    param (
        [Parameter(Mandatory=$true)]
        [string]$path
    )
    return $path -replace '\\', '/'
}

# Check the number of arguments
if ($args.Count -lt 1) {
    $script_name = Split-Path $PSCommandPath -Leaf
    Write-Output "Error: No path provided. Please provide a Windows path as an argument."
    Write-Output "Usage: $script_name <Windows path>"
    exit 1
}

$path = $args[0]
$converted_path = Convert-Path -path $path
Write-Output "$converted_path"
