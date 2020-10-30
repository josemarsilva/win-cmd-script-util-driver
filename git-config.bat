@ECHO OFF
REM ###########################################################################
REM # Filename: git-config.bat
REM # Purpose : Execute git config [args] in all sub-directories
REM # Source  : 
REM #           * https://github.com/josemarsilva/win-cmd-script-util-driver.git
REM ###########################################################################

IF "%1" == "" (
	ECHO usage: git config [ options ]
	ECHO   Examples:
	ECHO     git-config --local user.name "Josemar Silva"
	ECHO     git-config --local user.email "josemarsilva@yahoo.com.br"
	ECHO     git-config http.sslVerify "false"
	ECHO     git-config --list
	GOTO EndOfScript
)

FOR /f "tokens=*" %%G IN ('DIR /a:d /b /o:n /o:-d') DO (
  ECHO ------------------------------------------------------------------------------------------------------------------------
  CD %%G
  CD
  IF EXIST ".git\" (
	ECHO git config %1 %2 %3 %4 %5 %6 %7 %8
	git config %1 %2 %3 %4 %5 %6 %7 %8
  ) ELSE (
	ECHO It's not a git repository ... skipped !
  )
  CD ..
)
ECHO ------------------------------------------------------------------------------------------------------------------------

:EndOfScript
