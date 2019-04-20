ECHO OFF
REM ###########################################################################
REM # Filename: add-python36-to-path.bat
REM # Purpose : Add 'python36' program to Windows PATH
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\Users\Inmetrics\AppData\Local\Programs\Python\Python36\Scripts\
SET PROGRAM_PATH_EXT=C:\Users\Inmetrics\AppData\Local\Programs\Python\Python36\
SET PROGRAM_NAME=python.exe
SET PROGRAM_DOWNLOAD=https://www.python.org/downloads/release/python-368/

REM Custom environment variables defined ?
IF DEFINED PYTHON36BIN_PATH (
	ECHO.
	ECHO 'PYTHON36BIN_PATH' redefines 'PROGRAM_PATH' to '%PYTHON36BIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%PYTHON36BIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'PYTHON36BIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%;%PROGRAM_PATH_EXT%"
	PATH
)
