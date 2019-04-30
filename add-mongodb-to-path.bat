ECHO OFF
REM ###########################################################################
REM # Filename: add-mongodb-to-path.bat
REM # Purpose : Add 'mongodb' program to Windows PATH
REM # Source  : 
REM #           * https://www.mongodb.com/download-center
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\Program Files (x86)\mongodb-win32-x86_64-2008plus-3.2.1\bin
SET PROGRAM_NAME=mongo.exe
SET PROGRAM_DOWNLOAD=https://www.mongodb.com/download-center

REM Custom environment variables defined ?
IF DEFINED MONGODBBIN_PATH (
	ECHO.
	ECHO 'MONGODBBIN_PATH' redefines 'PROGRAM_PATH' to '%MONGODBBIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%MONGODBBIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'MONGODBBIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
)
