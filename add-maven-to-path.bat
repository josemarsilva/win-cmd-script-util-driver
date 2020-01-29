ECHO OFF
REM ###########################################################################
REM # Filename: add-maven-to-path.bat
REM # Purpose : Add 'maven' program to Windows PATH
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\Apps\apache-maven-3.6.3\bin
SET PROGRAM_NAME=mvn.cmd
SET PROGRAM_DOWNLOAD=https://maven.apache.org/install.html

REM Custom environment variables defined ?
IF DEFINED MAVEN_PATH (
	ECHO.
	ECHO 'MAVEN_PATH' redefines 'PROGRAM_PATH' to '%MAVEN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%MAVEN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'MAVEN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
)
