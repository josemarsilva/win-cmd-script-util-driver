ECHO OFF
REM ###########################################################################
REM # Filename: git-pull-status.bat
REM # Purpose : Execute git pull and git status in all sub-directories
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

FOR /f "tokens=*" %%G IN ('DIR /a:d /b /o:n /o:-d') DO (
  ECHO ------------------------------------------------------------------------------------------------------------------------
  CD %%G
  CD
  IF EXIST ".git\" (
    ECHO git pull
    git pull
    ECHO git status
    git status
  ) ELSE (
    ECHO It's not a git repository ... skipped !
  )
  CD ..
)
  ECHO ------------------------------------------------------------------------------------------------------------------------
