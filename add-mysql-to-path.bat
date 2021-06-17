ECHO OFF
REM ###########################################################################
REM # Filename: add-mysql-to-path.bat
REM # Purpose : Add 'mysql' program to Windows PATH
REM # Source  : 
REM #           * https://dev.mysql.com/downloads/mysql/5.7.html#downloads
REM ###########################################################################

REM Program defaults ...
REM SET PROGRAM_PATH=C:\PROGRA~1\mysql-5.7.25-winx64\bin
SET PROGRAM_PATH=C:\APPS\mysql-5.7.25-winx64\bin
SET PROGRAM_NAME=mysql.exe
SET PROGRAM_DOWNLOAD=https://dev.mysql.com/downloads/mysql/5.7.html#downloads

REM Custom environment variables defined ?
IF DEFINED MYSQLWINBIN_PATH (
	ECHO.
	ECHO 'MYSQLWINBIN_PATH' redefines 'PROGRAM_PATH' to '%MYSQLWINBIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%MYSQLWINBIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'MYSQLWINBIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
)
