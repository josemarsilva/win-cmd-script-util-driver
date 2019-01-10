ECHO OFF
REM ###########################################################################
REM # Filename: add-curl-to-path.bat
REM # Purpose : Add 'curl' program to Windows PATH
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\PROGRA~1\curl-7.62.0-win64-mingw\bin
SET PROGRAM_NAME=curl.exe
SET PROGRAM_DOWNLOAD=https://curl.haxx.se/download.html

REM Custom environment variables defined ?
IF DEFINED CURLBIN_PATH (
	ECHO.
	ECHO 'CURLBIN_PATH' redefines 'PROGRAM_PATH' to '%CURLBIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%CURLBIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'CURLBIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
)
