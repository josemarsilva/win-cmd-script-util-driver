ECHO OFF
REM ###########################################################################
REM # Filename: add-psql-to-path.bat
REM # Purpose : Add 'psql' program to Windows PATH
REM # Source  : 
REM #           * https://dev.psql.com/downloads/psql/5.7.html#downloads
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH="C:\Program Files (x86)\pgAdmin III\1.22"
SET PROGRAM_NAME=psql.exe
SET PROGRAM_DOWNLOAD=https://www.devmedia.com.br/postgresql-tutorial/33025

REM Custom environment variables defined ?
IF DEFINED PSQLWINBIN_PATH (
	ECHO.
	ECHO 'PSQLWINBIN_PATH' redefines 'PROGRAM_PATH' to '%PSQLWINBIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%PSQLWINBIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'PSQLWINBIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
)
