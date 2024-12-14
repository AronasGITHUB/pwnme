@echo off
cls
echo.
echo.
echo "                                            .___           ___.                        ._."
echo "________  _  ______   _____   ____        __| _/_ __  _____\_ |__ _____    ______ _____| |"
echo "\____ \ \/ \/ /    \ /     \_/ __ \      / __ |  |  \/     \| __ \\__  \  /  ___//  ___/ |"
echo "|  |_> >     /   |  \  Y Y  \  ___/     / /_/ |  |  /  Y Y  \ \_\ \/ __ \_\___ \ \___ \ \|"
echo "|   __/ \/\_/|___|  /__|_|  /\___  > /\ \____ |____/|__|_|  /___  (____  /____  >____  >__"
echo "|__|              \/      \/     \/  \/      \/           \/    \/     \/     \/     \/ \/"
echo.
echo "v1 - User pwner"
echo.
echo "-------------------------------------------------------------------------------------------------------------------------"
echo.
echo "[1] - Pwn a user"
echo "[2] - Switch local users"
echo "[3] - Send message"
echo "[4] - Grab information"
echo "[q] - Quit"
echo "This script does NOT manage local accounts."
echo "This script is for ethical and legal purposes only."

:menu
set /p cmd="> "
if "%cmd%"=="1" goto pwn_user
if "%cmd%"=="2" goto switch_user
if "%cmd%"=="3" goto send_message
if "%cmd%"=="4" goto grab_info
if "%cmd%"=="q" exit
goto menu

:pwn_user
cls
echo "-- Method --"
echo "[1] - Remote Desktop"
echo "[2] - SSH"
set /p method_1="> "
if "%method_1%"=="1" goto mstsc
if "%method_1%"=="2" goto ssh
goto pwn_user

:mstsc
mstsc
goto menu

:ssh
set /p ssh_user="Enter the username: "
set /p ssh_server="Enter the hostname, or IP Address: "
echo Connecting to %ssh_user%@%ssh_server%
ssh %ssh_user%@%ssh_server%
goto menu

:switch_user
set /p su_username="Enter the username: "
runas /user:%su_username% cmd
goto menu

:send_message
cls
echo "-- Method --"
echo "[1] - Global, send message to all logged in users"
echo "[2] - Local, send message to specific user"
set /p method_2="> "
if "%method_2%"=="1" goto global_message
if "%method_2%"=="2" goto local_message
goto send_message

:global_message
set /p wall_message="Enter message: "
echo %wall_message% | msg * 
goto menu

:local_message
set /p write_message="Who do you want to message?: "
echo Sending message. Write down your message, then press CTRL-Z to send.
echo %write_message% | msg %write_message%
goto menu

:grab_info
cls
echo --- Logged in user's info ---
whoami
echo.
echo --- Activity ---
netstat -an
echo.
echo --- Groups, and IDs ---
echo Not available in CMD
echo.
echo --- Basic info ---
echo User: %USERNAME%
echo Hostname: %COMPUTERNAME%
echo IP address not available
goto menu
