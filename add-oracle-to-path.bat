ECHO OFF
REM ###########################################################################
REM # Filename: add-oracle-to-path.bat
REM # Purpose : Add 'oracle' program to Windows PATH
REM # Source  : 
REM #           * http://oracle.apache.org/download/
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\PROGRA~1\Oracle\product\12.2.0\client_1
SET PROGRAM_NAME=sqlplus.exe
SET PROGRAM_DOWNLOAD=http://oracle.apache.org/download/

REM Custom environment variables defined ?
IF DEFINED ORACLEBIN_PATH (
	ECHO.
	ECHO 'ORACLEBIN_PATH' redefines 'PROGRAM_PATH' to '%ORACLEBIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%ORACLEBIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'ORACLEBIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
)
