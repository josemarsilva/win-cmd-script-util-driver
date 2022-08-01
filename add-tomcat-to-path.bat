ECHO OFF
REM ###########################################################################
REM # Filename: add-tomcat-to-path.bat
REM # Purpose : Add 'tomcat' program to Windows PATH
REM # Source  : 
REM #           * http://tomcat.apache.org/download/
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\Apps\apache-tomcat-8.5.24\bin
SET PROGRAM_NAME=catalina.bat
SET PROGRAM_DOWNLOAD=https://tomcat.apache.org/

REM Custom environment variables defined ?
IF DEFINED TOMCATBIN_PATH (
	ECHO.
	ECHO 'TOMCATBIN_PATH' redefines 'PROGRAM_PATH' to '%TOMCATBIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%TOMCATBIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'TOMCATBIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	REM SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
	ECHO TO RUN Catalina/Tomcat8 do:
	ECHO    - C:\ cd %PROGRAM_PATH%
	ECHO    - C:\ catalina start
	ECHO    - User configured: tomcat/s3cret
)
