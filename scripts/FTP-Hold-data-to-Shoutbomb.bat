@echo off
title Hold Pickup Notice Generator
color 0a

echo.
echo.

REM Run the Sql Workbench/J scripts for holds, renewals and overdues. Scripts also save files.

echo Pulling data from the DB and writting to a file...
echo.
echo.

java -jar C:\SQLWorkbench\sqlworkbench.jar -script='C:\Shoutbomb\scripts\holds.sql' -profile=prpld

REM Run winscp to ftp the files over to Shoutbomb

echo Sending files via FTP to ShouthBomb...
echo.
echo.

"C:/Program Files (x86)/WinSCP/winscp.com" /command "option batch abort" "option confirm off" "open ShoutBomb" "put C:\Shoutbomb\Holds\*.* /Holds/" "exit"

REM move the ftp'd files over to archive folder

echo.
echo.

echo Move files to the Archive folder...

CD C:\

MOVE C:\Shoutbomb\Holds\*.* C:\Shoutbomb\Archive\Holds\

REM Close the FTP connection to the Shoutbomb server

quit
