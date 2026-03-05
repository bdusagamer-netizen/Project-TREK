@echo off
REM Trek Archive Tool Launcher
REM Usage: archive-folder.bat <source_directory> [--recurse] [--replace]

if "%~1"=="" (
    echo Usage: archive-folder.bat ^<source_directory^> [--recurse] [--replace]
    echo.
    echo Examples:
    echo   archive-folder.bat myfolder
    echo   archive-folder.bat myfolder --recurse
    echo   archive-folder.bat myfolder --replace
    echo   archive-folder.bat myfolder --recurse --replace
    echo.
    echo Options:
    echo   --recurse    Include subdirectories
    echo   --replace    Replace folder with archive file ^(like ZIP^)
    echo.
    echo Archive will be named: ^(folder name^).trek.archive
    echo.
    echo This will create a .trek.archive file containing all files from the source directory.
    exit /b 1
)

set SOURCE_DIR=%~1
set RECURSE_FLAG=false
set REPLACE_FLAG=false

REM Parse remaining arguments
if "%~2"=="--recurse" (
    set RECURSE_FLAG=true
)
if "%~2"=="--replace" (
    set REPLACE_FLAG=true
)
if "%~3"=="--recurse" (
    set RECURSE_FLAG=true
)
if "%~3"=="--replace" (
    set REPLACE_FLAG=true
)

REM Build PowerShell command
set PS_CMD=powershell -ExecutionPolicy Bypass -File "%~dp0archive-tool.ps1" -SourcePath "%SOURCE_DIR%"

if "%RECURSE_FLAG%"=="true" (
    set PS_CMD=%PS_CMD% -Recurse
)
if "%REPLACE_FLAG%"=="true" (
    set PS_CMD=%PS_CMD% -Replace
)

%PS_CMD%