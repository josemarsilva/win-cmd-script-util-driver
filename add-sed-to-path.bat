ECHO OFF
REM ###########################################################################
REM # Filename: add-sed-to-path.bat
REM # Purpose : Add 'sed' program to Windows PATH
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\PROGRA~2\GnuWin32\bin
SET PROGRAM_NAME=sed.exe
SET PROGRAM_DOWNLOAD=https://sourceforge.net/projects/gnuwin32/files/sed/

REM Custom environment variables defined ?
IF DEFINED GNUWIN32SEDBIN_PATH (
	ECHO.
	ECHO 'GNUWIN32SEDBIN_PATH' redefines 'PROGRAM_PATH' to '%GNUWIN32SEDBIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%GNUWIN32SEDBIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'GNUWIN32SEDBIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
)
