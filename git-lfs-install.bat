@ECHO OFF
REM ###########################################################################
REM # Filename: git-lfs-install.bat
REM # Purpose : Execute git lfs install in all sub-directories
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

REM Default commit message is "." when no argument was passed ...
SET MSG=%1 %2 %3 %4 %5 %6 %7 %8
IF "%1" == "" SET MSG=.

FOR /f "tokens=*" %%G IN ('DIR /a:d /b /o:n /o:-d') DO (
  ECHO ------------------------------------------------------------------------------------------------------------------------
  CD %%G
  CD
  IF EXIST ".git\" (
    ECHO git lfs install
    git lfs install
  ) ELSE (
    ECHO It's not a git repository ... skipped !
  )
  CD ..
)
ECHO ------------------------------------------------------------------------------------------------------------------------
