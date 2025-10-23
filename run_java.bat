@echo off
cd /d "%~dp0"

echo Current directory: %cd%
echo.

echo Checking Java installation...
java -version
if %errorlevel% neq 0 (
    echo Java not found in PATH. Please check your installation.
    echo.
    pause
    exit /b
)

echo Running Java script...
echo -----------------------------
java java_counter.java
echo -----------------------------

echo.
echo Script finished.
pause