@echo off
Title Archived files removal
color 0a
echo.
echo.
echo Removing archived files older than 7 days...
echo.
echo.
forfiles /p "C:\Shoutbomb\Archive\Holds" /s /m *_MDT.txt /D -7 /C "cmd /c del /F /Q @path"
forfiles /p "C:\Shoutbomb\Archive\Renewals" /s /m *_MDT.txt /D -7 /C "cmd /c del /F /Q @path"
forfiles /p "C:\Shoutbomb\Archive\Overdue" /s /m *_MDT.txt /D -7 /C "cmd /c del /F /Q @path"

REM Close the FTP connection to the Shoutbomb server

quit