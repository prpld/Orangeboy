@echo off
title Notice Generator
color 0a

echo.
echo.

REM Run the Sql Workbench/J scripts for the Circulation, EBSCO and WAM weekly snapshots. Scripts also save files.

echo Pulling data from the DB and writting to a file...
echo.
echo.

java -jar C:\SQLWorkbench\sqlworkbench.jar -script='C:\Orangeboy\scripts\circulation.sql','C:\Orangeboy\scripts\WAM.sql','C:\Orangeboy\scripts\EBSCO.sql' -profile=prpld

REM Run winscp to ftp the files over to Orangeboy

echo Sending files via FTP to Orangeboy...
echo.
echo.

"C:/Program Files (x86)/WinSCP/winscp.com" /command "option batch abort" "option confirm off" "open Orangeboy" "put C:\Orangeboy\Circulation\*.* /Circulation/" "put C:\Orangeboy\WAM\*.* /WAM/" "exit"


REM Run winscp to ftp the files over to EBSCO

echo Sending files via FTP to EBSCO...
echo.
echo.

"C:/Program Files (x86)/WinSCP/winscp.com" /command "option batch abort" "option confirm off" "open EBSCO" "put C:\Orangeboy\EBSCO\*.* " "exit"


REM move the ftp'd files over to archive folder

echo.
echo.

echo Move files to the Archive folder...

CD C:\
MOVE C:\Orangeboy\Circulation\*.* C:\Orangeboy\Archive\Circulation\
MOVE C:\Orangeboy\WAM\*.* C:\Orangeboy\Archive\WAM\
MOVE C:\Orangeboy\EBSCO\*.* C:\Orangeboy\Archive\EBSCO\

REM Close the FTP connection to the Orangeboy server

-- Uncomment the line below once testing has been completed
quit
