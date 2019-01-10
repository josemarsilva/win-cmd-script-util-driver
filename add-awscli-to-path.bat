ECHO OFF
REM ###########################################################################
REM # Filename: add-awscli-to-path.bat
REM # Purpose : Add 'awscli' program to Windows PATH
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\Program Files\Amazon\AWSCLI
SET PROGRAM_NAME=aws.exe
SET PROGRAM_DOWNLOAD=https://aws.amazon.com/pt/cli/

REM Custom environment variables defined ?
IF DEFINED AWSCLIBIN_PATH (
	ECHO.
	ECHO 'AWSCLIBIN_PATH' redefines 'PROGRAM_PATH' to '%AWSCLIBIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%AWSCLIBIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'AWSCLIBIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
)
