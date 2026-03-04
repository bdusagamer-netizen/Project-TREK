@echo off
REM Trek Language Package Builder for Windows
REM Builds and packages Trek for distribution

setlocal enabledelayedexpansion

echo =============================
echo Trek Language Package Builder
echo =============================

set VERSION=1.0.0
set DIST_DIR=dist

REM Create distribution directory
if not exist "%DIST_DIR%" mkdir "%DIST_DIR%"

echo.
echo Step 1: Validating package.json...
if not exist "package.json" (
    echo Error: package.json not found
    exit /b 1
)
echo OK package.json found

echo.
echo Step 2: Installing dependencies...
call npm install
if errorlevel 1 (
    echo Error: npm install failed
    exit /b 1
)
echo OK Dependencies installed

echo.
echo Step 3: Creating npm package...
call npm pack --pack-destination="%DIST_DIR%"
if errorlevel 1 (
    echo Error: npm pack failed
    exit /b 1
)
echo OK Created trek-format-%VERSION%.tgz

echo.
echo Step 4: Creating VS Code extension (.vsix)...
where vsce >nul 2>nul
if !errorlevel! equ 0 (
    call vsce package -o "%DIST_DIR%\trek-language-%VERSION%.vsix"
    if errorlevel 1 (
        echo Warning: vsce failed. Install with: npm install -g vsce
    ) else (
        echo OK Created trek-language-%VERSION%.vsix
    )
) else (
    echo Warning: vsce not installed. Install with: npm install -g vsce
    echo To manually create extension, run: vsce package
)

echo.
echo =============================
echo Build Complete!
echo =============================
echo.
echo Distribution files created in: %DIST_DIR%
echo.
echo Next steps:
echo 1. Test .vsix in VS Code: Extensions - Install from VSIX
echo 2. Upload to GitHub Releases
echo 3. Publish to npm: npm publish
echo 4. Submit to VS Code Marketplace: vsce publish
echo.

pause
