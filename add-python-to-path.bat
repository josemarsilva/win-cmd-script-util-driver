ECHO OFF
REM ###########################################################################
REM # Filename: add-python-to-path.bat
REM # Purpose : Add 'python' program to Windows PATH
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

REM Program defaults ...
SET PROGRAM_PATH=C:\ProgramData\Anaconda3
SET PROGRAM_PATH_EXT=C:\ProgramData\Anaconda3\Library\mingw-w64\bin;C:\ProgramData\Anaconda3\Library\usr\bin;C:\ProgramData\Anaconda3\Library\bin;C:\ProgramData\Anaconda3\Scripts;C:\ProgramData\Anaconda3\bin;
SET PROGRAM_NAME=python.exe
SET PROGRAM_DOWNLOAD=https://www.python.org/downloads/

REM Custom environment variables defined ?
IF DEFINED PYTHONBIN_PATH (
	ECHO.
	ECHO 'PYTHONBIN_PATH' redefines 'PROGRAM_PATH' to '%PYTHONBIN_PATH%'
	ECHO.
	SET PROGRAM_PATH=%PYTHONBIN_PATH%
)

REM If Program is correctly installed Then add to path ...
IF NOT EXIST %PROGRAM_PATH%\%PROGRAM_NAME% (
	ECHO.
	ECHO ERROR: '%PROGRAM_NAME%' not properly installed!
	ECHO        - File '%PROGRAM_PATH%\%PROGRAM_NAME%' does not exists
	ECHO        - Download %PROGRAM_NAME% from %PROGRAM_DOWNLOAD%
	ECHO        - Install %PROGRAM_NAME% into '%PROGRAM_PATH%' ...
	ECHO          ... or define environment variable 'PYTHONBIN_PATH'
	ECHO.
) ELSE (
	ECHO.
	ECHO Adding '%PROGRAM_NAME%' to PATH environment ...
	ECHO.
	SET "PATH=%PATH%;%PROGRAM_PATH%;%PROGRAM_PATH_EXT%"
	PATH
)
