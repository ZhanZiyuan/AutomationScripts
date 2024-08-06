function Copy-SpecificFiles {
    param (
        [string]$source,
        [string]$destination,
        [string[]]$fileTypes
    )

    Get-ChildItem -Path $source -Include $fileTypes -Recurse | ForEach-Object {
        $dest = $destination + $_.FullName.Substring($source.length)
        $destDir = [System.IO.Path]::GetDirectoryName($dest)
        New-Item -ItemType Directory -Force -Path $destDir
        Move-Item -Path $_.FullName -Destination $dest
    }
}

# Check the number of arguments
if ($args.Count -lt 3) {
    $script_name = Split-Path $PSCommandPath -Leaf
    Write-Output "Error: insufficient parameters."
    Write-Output "Usage: $script_name <source> <destination> <filetype 1> [<filetype 2> ...]"
    exit 1
}

$source = $args[0]
$destination = $args[1]
$fileTypes = $args[2..($args.Count - 1)] | ForEach-Object { "*.$_" }

Copy-SpecificFiles -source $source -destination $destination -fileTypes $fileTypes
