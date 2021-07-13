ECHO OFF
REM ###########################################################################
REM # Filename: add-ngrok-to-path.bat
REM # Purpose : Add 'ngrok' program to Windows PATH
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\Apps\ngrok-stable-windows-amd64
SET PROGRAM_NAME=ngrok.exe
SET PROGRAM_DOWNLOAD=https://ngrok.com/

REM Custom environment variables defined ?
IF DEFINED NGROK_PATH (
	ECHO.
	ECHO 'NGROK_PATH' redefines 'PROGRAM_PATH' to '%NGROK_PATH%'
	ECHO.
	SET PROGRAM_PATH=%NGROK_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'NGROK_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
)
