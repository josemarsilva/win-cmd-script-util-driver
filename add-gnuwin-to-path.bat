ECHO OFF
REM ###########################################################################
REM # Filename: add-gnuwin-to-path.bat
REM # Purpose : Add ( 'awk', 'sed' ) program to Windows PATH
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\PROGRA~2\GnuWin32\bin
SET PROGRAM_NAME=awk.exe
SET PROGRAM_DOWNLOAD=http://gnuwin32.sourceforge.net/packages/gnuwin.htm

REM Custom environment variables defined ?
IF DEFINED GNUWINBIN_PATH (
	ECHO.
	ECHO 'GNUWINBIN_PATH' redefines 'PROGRAM_PATH' to '%GNUWINBIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%GNUWINBIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'GNUWINBIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
)
