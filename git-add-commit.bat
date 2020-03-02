@ECHO OFF
REM ###########################################################################
REM # Filename: git-add-commit.bat
REM # Purpose : Execute git add and git commit in all sub-directories
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
    ECHO git add .
    git add .
    ECHO git commit -a -m "%MSG%"
    git commit -a -m "%MSG%"
  ) ELSE (
    ECHO It's not a git repository ... skipped !
  )
  CD ..
)
ECHO ------------------------------------------------------------------------------------------------------------------------
