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
        Copy-Item -Path $_.FullName -Destination $dest
    }
}

$source = "D:\zigzag\Python Assignments\received"
$destination = "C:\Users\user\Downloads\received"
$fileTypes = @("*.py", "*.ipynb")

Copy-SpecificFiles -source $source -destination $destination -fileTypes $fileTypes
