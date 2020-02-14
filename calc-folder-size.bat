@echo off
REM ***************************************************************************
REM Filename   : calc-folder-size.bat
REM Description: Calculates folder size
REM Source-Code: https://github.com/josemarsilva/win-cmd-script-util-driver
REM References :
REM              * https://stackoverflow.com/questions/21711180/how-to-list-all-folder-with-size-via-batch-file
REM ***************************************************************************

REM Check arguments ...

IF [%1] == [] GOTO ExitWithError

REM Looping ...

setlocal disabledelayedexpansion
set "folder=%~1"
if not defined folder set "folder=%cd%"

echo folder-name;size-in-bytes

for /d %%a in ("%folder%\*") do (
	set "size=0"
	for /f "tokens=3,5" %%b in ('dir /-c /a /w /s "%%~fa\*" 2^>nul ^| findstr /b /c:"  "') do if "%%~c"=="" set "size=%%~b"
	setlocal enabledelayedexpansion
	echo(%%~nxa;!size!
	endlocal
)

endlocal

REM Normal exit ...
exit

REM Error ...

:ExitWithError

echo.
echo calc-folder-size.bat ^<base-folder^>
echo Calculates Folder Size - v.2020.02.14
echo   - ^<base-folder^>: base folder name(\*)
echo Usage: calc-folder-size.bat ^<base-folder^>
echo Example: calc-folder-size.bat C:\
echo.

