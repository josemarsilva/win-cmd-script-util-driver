ECHO OFF
REM ###########################################################################
REM # Filename: add-xsltproc-to-path.bat
REM # Purpose : Add 'xsltproc' program to Windows PATH
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\PROGRA~1\xsltproc\bin
SET PROGRAM_NAME=xsltproc.exe
SET PROGRAM_DOWNLOAD=https://www.zlatkovic.com/pub/libxml/64bit/

REM Custom environment variables defined ?
IF DEFINED XSLTPROCBIN_PATH (
	ECHO.
	ECHO 'XSLTPROCBIN_PATH' redefines 'PROGRAM_PATH' to '%XSLTPROCBIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%XSLTPROCBIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'XSLTPROCBIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
)
