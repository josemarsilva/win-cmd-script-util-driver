ECHO OFF
REM ###########################################################################
REM # Filename: add-jmeter-to-path.bat
REM # Purpose : Add 'jmeter' program to Windows PATH
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\PROGRA~1\apache-jmeter-5.0\bin
SET PROGRAM_NAME=jmeter
SET PROGRAM_DOWNLOAD=https://jmeter.apache.org/download_jmeter.cgi

REM Custom environment variables defined ?
IF DEFINED JMETERBIN_PATH (
	ECHO.
	ECHO 'JMETERBIN_PATH' redefines 'PROGRAM_PATH' to '%JMETERBIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%JMETERBIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'JMETERBIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
)
