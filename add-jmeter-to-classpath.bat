ECHO OFF
REM ###########################################################################
REM # Filename: add-jmeter-jar-to-classpath.bat
REM # Purpose : Add 'jmeter' libraries (*.jar) to Java CLASSPATH
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

REM Program defaults ...
SET PROGRAMHOME_PATH=C:\PROGRA~1\apache-jmeter-5.0
SET PROGRAMJARLIB_NAME=jmeter
SET PROGRAM_DOWNLOAD=https://jmeter.apache.org/download_jmeter.cgi

REM Custom environment variables defined ?
IF DEFINED JMETER_HOME (
	ECHO.
	ECHO 'JMETER_HOME' redefines 'PROGRAMHOME_PATH' to '%JMETER_HOME%'
	ECHO.
	SET PROGRAMHOME_PATH=%JMETER_HOME%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAMHOME_PATH%\ (
	ECHO.
	ECHO ERROR: '%PROGRAMJARLIB_NAME%' not properly installed!
	ECHO        - File '%PROGRAMHOME_PATH%\%PROGRAMJARLIB_NAME%' does not exists
	ECHO        - Download %PROGRAMJARLIB_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAMJARLIB_NAME% into '%PROGRAMHOME_PATH%' ...
	ECHO          ... or define environment variable 'JMETER_HOME'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAMJARLIB_NAME%' to CLASSPATH environment variable ...
	ECHO.
	SETLOCAL ENABLEDELAYEDEXPANSION
	FOR /R %PROGRAMHOME_PATH% %%G IN (*.jar) DO (
		SET DELAYEDEXPANSION_LIST=!DELAYEDEXPANSION_LIST!:%%G
	)
	SET CLASSPATH=.!DELAYEDEXPANSION_LIST!
	ECHO CLASSPATH %CLASSPATH% !CLASSPATH!
	Nao sei como setar classpath 
)
