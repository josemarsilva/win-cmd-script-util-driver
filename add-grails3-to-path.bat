ECHO OFF
REM ###########################################################################
REM # Filename: add-grails3-to-path.bat
REM # Purpose : Add 'grails3' program to Windows PATH
REM # Source  : 
REM #           * http://grails.org/download.html
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\grails-3.3.9\bin
SET PROGRAM_NAME=grails.bat
SET PROGRAM_DOWNLOAD=http://grails.org/download.html

REM Custom environment variables defined ?
IF DEFINED GRAILS3_BIN_PATH (
	ECHO.
	ECHO 'GRAILS3_BIN_PATH' redefines 'PROGRAM_PATH' to '%GRAILS3_BIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%GRAILS3_BIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'GRAILS3_BIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
)
