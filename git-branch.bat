@ECHO OFF
REM ###########################################################################
REM # Filename: git-branch.bat
REM # Purpose : Execute git branch [args] in all sub-directories
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

FOR /f "tokens=*" %%G IN ('DIR /a:d /b /o:n /o:-d') DO (
  ECHO ------------------------------------------------------------------------------------------------------------------------
  CD %%G
  CD
  IF EXIST ".git\" (
    ECHO git branch --list
    git branch --list
    IF NOT "%1" == "" (
      git branch --list %1 > ..\git-branch.tmp
	  SET STR= < ..\git-branch.tmp
      DEL /Q ..\git-branch.tmp
      IF NOT "%STR" == "" (
        ECHO git checkout %1 ; git pull ; git status
        git checkout %1
        git git pull
        git status
      )
    )
  ) ELSE (
    ECHO It's not a git repository ... skipped !
  )
  CD ..
)
ECHO ------------------------------------------------------------------------------------------------------------------------
