@echo off

rem Check if script is running as administrator
net session >nul 2>&1
if not errorlevel 1 (

    rem Check if Hyper-V is already enabled
    bcdedit /enum | findstr /c:"hypervisorlaunchtype" | findstr /c:"Auto" >nul
    if errorlevel 1 (
        bcdedit /set {current} hypervisorlaunchtype auto
        shutdown -r -t 2
    ) else (
        echo Hyper-V is already enabled.
        pause
        exit
    )

) else (
    echo Script is not running as administrator.
    echo Please run as administrator and try again.
    pause
    exit
)