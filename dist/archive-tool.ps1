# Trek Archive Tool
# Creates .trek.archive files from directories

param(
    [Parameter(Mandatory=$true)]
    [string]$SourcePath,

    [Parameter(Mandatory=$false)]
    [string]$OutputFile = "",

    [switch]$Recurse,

    [switch]$Replace
)

function ConvertTo-TrekFilename {
    param([string]$filename)
    return "=$filename="
}

function ConvertTo-TrekPath {
    param([string]$path)
    return $path.Replace('\', '/')
}

function Get-FileContent {
    param([string]$filePath)

    try {
        $content = Get-Content -Path $filePath -Raw -Encoding UTF8
        if ($null -eq $content) { $content = "" }
        return $content
    }
    catch {
        Write-Warning "Could not read file: $filePath"
        return ""
    }
}

function Write-TrekFile {
    param(
        [string]$filename,
        [string]$content,
        [string]$relativePath = "",
        [System.IO.StreamWriter]$writer
    )

    $trekFilename = ConvertTo-TrekFilename $filename

    if ($relativePath) {
        $writer.WriteLine(".file[.ARG is_in /$relativePath](1)(")
    } else {
        $writer.WriteLine(".file(1)(")
    }

    $writer.WriteLine("    TREK filename: $trekFilename")
    $writer.WriteLine("    (OVERRIDE_ELEMENT--RUNAS)")
    $writer.WriteLine("    (OVERRIDE_ELEMENT--SECTION)")
    $writer.WriteLine("    (OVERRIDE_ELEMENT--VARIABLES)")
    $writer.WriteLine("    --FILECODE{")
    $writer.WriteLine($content)
    $writer.WriteLine("    }")
    $writer.WriteLine(")")
}

function Write-TrekDirectory {
    param(
        [string]$dirname,
        [string]$content,
        [string]$relativePath = "",
        [System.IO.StreamWriter]$writer
    )

    $trekFilename = ConvertTo-TrekFilename "$dirname[.ARG is_folder]"

    if ($relativePath) {
        $writer.WriteLine(".subfolder[.ARG is_in /$relativePath](1)(")
    } else {
        $writer.WriteLine(".subfolder(1)(")
    }

    $writer.WriteLine("    TREK filename: $trekFilename")
    $writer.WriteLine("    --DIRECTORY{")
    $writer.WriteLine($content)
    $writer.WriteLine("    }")
    $writer.WriteLine(")")
}

function Process-Directory {
    param(
        [string]$directoryPath,
        [string]$relativePath = "",
        [System.IO.StreamWriter]$writer
    )

    # Get all files and directories
    $items = Get-ChildItem -Path $directoryPath

    foreach ($item in $items) {
        if ($item.PSIsContainer) {
            # It's a directory
            if ($Recurse) {
                # Collect content for this subdirectory
                $subContent = ""
                $subItems = Get-ChildItem -Path $item.FullName

                foreach ($subItem in $subItems) {
                    if (!$subItem.PSIsContainer) {
                        # File in subdirectory
                        $fileContent = Get-FileContent -filePath $subItem.FullName
                        $subContent += ".file(1)(
    TREK filename: $(ConvertTo-TrekFilename $subItem.Name)
    (OVERRIDE_ELEMENT--RUNAS)
    (OVERRIDE_ELEMENT--SECTION)
    (OVERRIDE_ELEMENT--VARIABLES)
    --FILECODE{
$fileContent
    }
)
"
                    }
                }

                Write-TrekDirectory -dirname $item.Name -content $subContent -relativePath $relativePath -writer $writer
            }
        } else {
            # It's a file
            $content = Get-FileContent -filePath $item.FullName
            Write-TrekFile -filename $item.Name -content $content -relativePath $relativePath -writer $writer
        }
    }
}

# Main script
if (!(Test-Path $SourcePath)) {
    Write-Error "Source path does not exist: $SourcePath"
    exit 1
}

if (!(Test-Path $SourcePath -PathType Container)) {
    Write-Error "Source path must be a directory: $SourcePath"
    exit 1
}

# Determine output file name (always use folder name)
$sourceName = Split-Path $SourcePath -Leaf
$OutputFile = "$sourceName.trek.archive"

Write-Host "Creating Trek archive: $OutputFile"
Write-Host "Source directory: $SourcePath"

try {
    $writer = New-Object System.IO.StreamWriter($OutputFile, $false, [System.Text.Encoding]::UTF8)

    # Process the directory
    Process-Directory -directoryPath $SourcePath -writer $writer

    $writer.Close()

    Write-Host "Archive created successfully: $OutputFile"

    # Replace folder with archive if requested
    if ($Replace) {
        Write-Host "Replacing folder with archive..."
        try {
            Remove-Item -Path $SourcePath -Recurse -Force
            Write-Host "Folder replaced successfully. Archive: $OutputFile"
        }
        catch {
            Write-Warning "Failed to remove source folder: $_"
        }
    }
}
catch {
    Write-Error "Failed to create archive: $_"
    exit 1
}