@echo off
Title Archived files removal
color 0a
echo.
echo.
echo Removing archived files older than 21 days...
echo.
echo.
forfiles /p "C:\Orangeboy\Archive\Circulation" /s /m prpld_circ_*.txt /D -21 /C "cmd /c del /F /Q @path"
forfiles /p "C:\Orangboy\Archive\EBSCO" /s /m PoudreLibraries_isbn_*.txt /D -21 /C "cmd /c del /F /Q @path"
forfiles /p "C:\Orangboy\Archive\WAM" /s /m prpld_database_*.txt /D -21 /C "cmd /c del /F /Q @path"


quit