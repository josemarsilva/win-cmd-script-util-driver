# #############################################################################
# filename   : purge-path-by-date.ps1
# description: PowerShell script to purge path files/folders by date criteria
# source-code: https://github.com/josemarsilva/jira-rpa-aas
# references :
#              * https://www.pdq.com/blog/using-get-childitem-find-files/
# #############################################################################
#

# #############################################################################
# Global initialization
# #############################################################################
$appProgram = "purge-path-by-date.ps1"
$appDescription = "PowerShell script to purge path files/subfolders by date criteria"
$release = "v.2020.10.01.1200"
Write-Host( "$appProgram - $release - $appDescription" )

# #############################################################################
# Function Command-Help()
# #############################################################################
Function Command-Help
{
    Write-Host( "usage: $appProgram ( [ -h | help ] | [ -p | path ] | [ -d | days ] | [ -i | ignore ]" )
    Write-Host( "" )
    Write-Host( "       -h help      Show usefull command line help" )
    Write-Host( "       -p path      Path folder and subfolders to purge. Ex: -p C:\temp" )
    Write-Host( "       -d days      Number of days before current date. Ex: -d 7" )
    Write-Host( "       -i ignore    Ignore file pattern. Ex: -i .keep" )
    Write-Host( "" )
}

# #############################################################################
# Function Is-Numeric($value)
# #############################################################################
Function Is-Numeric ($value)
{
    return $value -match "^[\d\.]+$"
}

# #############################################################################
# Function Check-Command-Arguments()
# #############################################################################
Function Check-Command-Arguments
{
    # check command arguments $argPath ...
    if ( -Not (Test-path $argPath) ) {
        Write-Host( "ERROR: Path argument value '$argPath' does *not* exists!" )
        Write-Host( "" )
        exit 1 # failure
    }
    # check command arguments $ ...
    if ( -Not (Is-Numeric $argDays) ) {
        Write-Host( "ERROR: Days argument value 'days' is *not* a numeric value!" )
        Write-Host( "" )
        exit 1 # failure
    }
}

# #############################################################################
# Function Command-Execute()
# #############################################################################
Function Command-Execute
{
    Check-Command-Arguments
    Write-Host( "" )
	$filterDate = (Get-Date).Date.AddDays( - $argDays )
    Get-ChildItem -Path $argPath | Where-Object { $_.LastWriteTime.Date -lt $filterDate } | Sort LastWriteTime | ForEach-Object {
        # Iterator
        $name = $_.Name
		if ( $name -eq $argIgnorePattern ) {
          Write-Host( "  * $name - skipping ..." )
          #Write-Host( "LastWriteTime: " + $_.LastWriteTime.Date )
		} else {
          Write-Host( "  * $name - deleting ..." )
		  Remove-Item -Path ( $argPath + "\" + $name ) -Force -Recurse
		}
    }
}

# #############################################################################
# main() ...
# #############################################################################

# Parse command arguments ...
$argPath = ""
$argDays = ""
$argIgnorePattern = ""
$argHelp = $False
$returnStatus = $True
$numOfArgs = $args.Length
for ($i=0; $i -lt $numOfArgs; $i++)
{
    # -h | -help
    if ( ($args[$i]).ToLower() -eq "-h" -or ($args[$i]).ToLower() -eq "-help" ) {
        $paramHelp = $True
    }
    # [ -p | -path ] <path>
    if ( ($args[$i]).ToLower() -eq "-p" -or ($args[$i]).ToLower() -eq "-path" ) {
        if (($i+1) -lt $numOfArgs) {
            $argPath = $args[($i+1)]
        }
    }
    # [ -d | -days ] <days>
    if ( ($args[$i]).ToLower() -eq "-d" -or ($args[$i]).ToLower() -eq "-days" ) {
        if (($i+1) -lt $numOfArgs) {
            $argDays = $args[($i+1)]
        }
    }
    # [ -i | -ignore ] <ignore-pattern>
    if ( ($args[$i]).ToLower() -eq "-i" -or ($args[$i]).ToLower() -eq "-ignore" ) {
        if (($i+1) -lt $numOfArgs) {
            $argIgnorePattern = $args[($i+1)]
        }
    }
}

# test command help ...
if ($paramHelp -or $numOfArgs -eq 0) {
    Command-Help
} else {
    # check command arguments
    if ($argPath -eq "") {
        Write-Host( "ERROR: 'path' argument is missing!" )
        Write-Host( "       Try help '$appProgram -h'" )
        $returnStatus = $False
    } elseif ($argDays -eq "") {
        Write-Host( "ERROR: 'days' argument is missing!" )
        Write-Host( "       Try help '$appProgram -h'" )
        $returnStatus = $False
    }
    # Command-Execute ...
    if ( $returnStatus ) {
      Command-Execute
	}
}

# Return Status
if ($returnStatus) {
    exit 0 # Success
} else {
    exit 1 # Failure
}
