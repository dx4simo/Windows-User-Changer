@echo off
color 30
title Dx4simo Windows Users tool

:password
set /p pass="Enter the password to access the tool: "
if "%pass%" neq "dx4simo" (
    echo Password is not correct! Try again...
    goto password
)

:menu
cls
echo.
echo *******************************
echo           Menu
echo *******************************
echo.
echo.
echo 1) List Users on Computer
echo 2) Create a new User
echo 3) Change a User password
echo 4) Delete a User Account
echo 5) Exit the tool
echo.
set /p input="> "

if "%input%" == "1" (
	title List Users
	cls
	net user
	pause
	cls
	goto menu
)

if "%input%"=="2" (
    call :checkadmin
    title Create a new User
    cls
    set /p username="USERNAME: "
    set /p password="PASSWORD: "
    net user %username% %password% /add
    echo New user has been added!
    pause
    goto menu
)

if "%input%"=="3" (
    call :checkadmin
    title Change a User password
    cls
    set /p username="TARGET USER: "
    set /p password="NEW PASSWORD: "
    net user %username% %password%
    echo Password changed successfully!
    pause
    goto menu
)

if "%input%"=="4" (
    cls
    echo "Are you sure you want to delete this account? What kind of person are you..."
    echo "Just kidding, this option is disabled."
    pause
    goto menu
)

if "%input%"=="5" exit


:checkadmin
net session >nul 2>&1
if %errorlevel% neq 0 (
    cls
    echo This operation reuire admin privilages!
    echo Restart the script and run it as administrator!
    pause
    exit
)