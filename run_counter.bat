@echo off
cd /d "%~dp0"

echo Current directory: %cd%
echo.

echo Checking Dart installation...
dart --version
if %errorlevel% neq 0 (
    echo Dart not found in PATH. Please check your installation.
    echo.
    pause
    exit /b
)

echo Running Dart script...
echo -----------------------------
dart counter.dart
echo -----------------------------

echo.
echo Script finished.
pause
