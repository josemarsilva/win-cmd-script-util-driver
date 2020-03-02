@ECHO OFF
REM ###########################################################################
REM # Filename: git-lfs-track.bat
REM # Purpose : Execute git lfs track in all sub-directories
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

REM Check arguments ...

IF "%1" == "" (
   ECHO.
   ECHO Usage:
   ECHO   git-lfs-track.bat "<.extension>"
   ECHO.
   ECHO Examples: git-lfs-track.bat "<.jar>"
   GOTO EndOfScript
)

FOR /f "tokens=*" %%G IN ('DIR /a:d /b /o:n /o:-d') DO (
  ECHO ------------------------------------------------------------------------------------------------------------------------
  CD %%G
  CD
  IF EXIST ".git\" (
    ECHO git lfs track %1
    git lfs track %1
  ) ELSE (
    ECHO It's not a git repository ... skipped !
  )
  CD ..
)
ECHO ------------------------------------------------------------------------------------------------------------------------

:EndOfScript
