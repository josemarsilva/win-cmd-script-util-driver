ECHO OFF
REM ###########################################################################
REM # Filename: add-golang-to-path.bat
REM # Purpose : Add 'golang' program to Windows PATH
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\PROGRA~1\Go\bin
SET PROGRAM_NAME=go.exe
SET PROGRAM_DOWNLOAD=https://go.dev/dl/

REM Custom environment variables defined ?
IF DEFINED GOLANGBIN_PATH (
	ECHO.
	ECHO 'GOLANGBIN_PATH' redefines 'PROGRAM_PATH' to '%GOLANGBIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%GOLANGBIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'GOLANGBIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
)
