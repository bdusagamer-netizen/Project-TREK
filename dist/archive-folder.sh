#!/bin/bash

# Trek Archive Tool Launcher for Linux/macOS
# Usage: ./archive-folder.sh <source_directory> [--recurse] [--replace]

if [ $# -eq 0 ]; then
    echo "Usage: $0 <source_directory> [--recurse] [--replace]"
    echo ""
    echo "Examples:"
    echo "  $0 myfolder"
    echo "  $0 myfolder --recurse"
    echo "  $0 myfolder --replace"
    echo "  $0 myfolder --recurse --replace"
    echo ""
    echo "Options:"
    echo "  --recurse    Include subdirectories"
    echo "  --replace    Replace folder with archive file (like ZIP)"
    echo ""
    echo "Archive will be named: (folder name).trek.archive"
    echo ""
    echo "This will create a .trek.archive file containing all files from the source directory."
    exit 1
fi

SOURCE_DIR="$1"
RECURSE_FLAG="$2"
REPLACE_FLAG="$3"

# Convert Windows path to Unix path if needed
if [[ "$SOURCE_DIR" == *\\* ]]; then
    SOURCE_DIR=$(echo "$SOURCE_DIR" | sed 's|\\|/|g')
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ "$RECURSE_FLAG" = "--recurse" ]; then
    if [ "$REPLACE_FLAG" = "--replace" ]; then
        pwsh -ExecutionPolicy Bypass -File "$SCRIPT_DIR/archive-tool.ps1" -SourcePath "$SOURCE_DIR" -Recurse -Replace
    else
        pwsh -ExecutionPolicy Bypass -File "$SCRIPT_DIR/archive-tool.ps1" -SourcePath "$SOURCE_DIR" -Recurse
    fi
elif [ "$RECURSE_FLAG" = "--replace" ]; then
    pwsh -ExecutionPolicy Bypass -File "$SCRIPT_DIR/archive-tool.ps1" -SourcePath "$SOURCE_DIR" -Replace
else
    pwsh -ExecutionPolicy Bypass -File "$SCRIPT_DIR/archive-tool.ps1" -SourcePath "$SOURCE_DIR"
fi