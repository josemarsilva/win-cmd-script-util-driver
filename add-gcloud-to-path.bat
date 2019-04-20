ECHO OFF
REM ###########################################################################
REM # Filename: add-gcloud-to-path.bat
REM # Purpose : Add 'gcloud' program to Windows PATH
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\Program Files (x86)\Google\Cloud SDK\google-cloud-sdk\bin
SET PROGRAM_NAME=gcloud.cmd
SET PROGRAM_DOWNLOAD=https://cloud.google.com/sdk/gcloud/

REM Custom environment variables defined ?
IF DEFINED GCLOUDCLIBIN_PATH (
	ECHO.
	ECHO 'GCLOUDCLIBIN_PATH' redefines 'PROGRAM_PATH' to '%GCLOUDCLIBIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%GCLOUDCLIBIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'GCLOUDCLIBIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%"
	PATH
)
