@echo off

rem Check if script is running as administrator
net session >nul 2>&1
if not errorlevel 1 (

    rem Check if Hyper-V is already disabled
    bcdedit /enum | findstr /c:"hypervisorlaunchtype" | findstr /c:"Off" >nul
    if errorlevel 1 (
        bcdedit /set {current} hypervisorlaunchtype off
        shutdown -r -t 2
    ) else (
        echo Hyper-V is already disabled.
        pause
        exit
    )

) else (
    echo Script is not running as administrator.
    echo Please run as administrator and try again.
    pause
    exit
)