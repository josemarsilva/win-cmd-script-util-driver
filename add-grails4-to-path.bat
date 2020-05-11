ECHO OFF
REM ###########################################################################
REM # Filename: add-grails4-to-path.bat
REM # Purpose : Add 'grails' program to Windows PATH
REM # Source  : 
REM #           * http://grails.org/download.html
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\Apps\grails-4.0.3\bin
SET PROGRAM_NAME=grails.bat
SET PROGRAM_DOWNLOAD=http://grails.org/download.html

REM Custom environment variables defined ?
IF DEFINED GRAILS_BIN_PATH (
	ECHO.
	ECHO 'GRAILS_BIN_PATH' redefines 'PROGRAM_PATH' to '%GRAILS_BIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%GRAILS_BIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'GRAILS_BIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	REM ECHO Setting '%PROGRAM_NAME%' with Java JDK 1.7 to PATH environment ...
	ECHO.
)

REM SET JAVA_HOME=C:\Program Files\Java\jdk1.7.0_80
REM SET PATH=%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\;%SYSTEMROOT%\System32\OpenSSH\;C:\Program Files\Git\cmd;%JAVA_HOME%\bin;%PROGRAM_PATH%;%M2_HOME%\bin;C:\Program Files\nodejs\;C:\Program Files\Microsoft VS Code\bin;C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\110\Tools\Binn\;C:\PROGRA~2\Microsoft SQL Server\120\Tools\Binn\;C:\Program Files\Microsoft SQL Server\120\Tools\Binn\;C:\Program Files\Microsoft SQL Server\120\DTS\Binn\;C:\PROGRA~2\Microsoft SQL Server\120\Tools\Binn\ManagementStudio\;C:\PROGRA~2\Microsoft SQL Server\120\DTS\Binn\;C:\Users\Inmetrics\Documents\win-cmd-script-util-driver;
ECHO JAVA_HOME=%JAVA_HOME%
ECHO PATH=%PATH%
