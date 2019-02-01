ECHO OFF
REM ###########################################################################
REM # Filename: add-coreutils-to-path.bat
REM # Purpose : Add 'sed' program to Windows PATH
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\PROGRA~2\coreutils-5.3.0-bin
SET PROGRAM_NAME=cat.exe
SET PROGRAM_DOWNLOAD=http://gnuwin32.sourceforge.net/packages/coreutils.htm

REM Custom environment variables defined ?
IF DEFINED COREUTILSWINBIN_PATH (
	ECHO.
	ECHO 'COREUTILSWINBIN_PATH' redefines 'PROGRAM_PATH' to '%COREUTILSWINBIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%COREUTILSWINBIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'COREUTILSWINBIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
)
