ECHO OFF
REM ###########################################################################
REM # Filename: git-fetch-diff.bat
REM # Purpose : Execute git fetch and git diff in all sub-directories
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

FOR /f "tokens=*" %%G IN ('DIR /a:d /b /o:n /o:-d') DO (
  ECHO ------------------------------------------------------------------------------------------------------------------------
  CD %%G
  CD
  IF EXIST ".git\" (
    ECHO git fetch
    git fetch
    ECHO git diff
    git diff
  ) ELSE (
    ECHO It's not a git repository ... skipped !
  )
  CD ..
)
ECHO ------------------------------------------------------------------------------------------------------------------------
