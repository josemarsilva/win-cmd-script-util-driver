ECHO OFF
REM ###########################################################################
REM # Filename: add-cassandra-to-path.bat
REM # Purpose : Add 'cassandra' program to Windows PATH
REM # Source  : 
REM #           * http://cassandra.apache.org/download/
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\Program Files\apache-cassandra-3.11.4\bin
SET PROGRAM_NAME=cassandra.bat
SET PROGRAM_DOWNLOAD=http://cassandra.apache.org/download/

REM Custom environment variables defined ?
IF DEFINED CASSANDRABIN_PATH (
	ECHO.
	ECHO 'CASSANDRABIN_PATH' redefines 'PROGRAM_PATH' to '%CASSANDRABIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%CASSANDRABIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'CASSANDRABIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
)
