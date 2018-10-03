$percent = 0
function Chuck-Progress($operation){
  $total_lines = ((Get-Content $Profile | Select-String -Pattern "Chuck-Progress").Length - 2)
  $percent = $percent + 1
  $percentage = [math]::truncate(($percent/$total_lines) * 100)
  Write-Progress -Activity "Loading Profile" -Status "Reading $profile and adding it to your environment . . ." -PercentComplete $percentage -CurrentOperation $operation
}

# Useful post processor - github/mdhiggins/sickbeard_mp4_automater
function MP4automater { py -2 C:\MP4Automater\manual.py $args }

# Removes PDF restrictions - mupdf.com
Chuck-Progress "Adding PDFClean"
function PDFClean { C:\Users\Manu\Desktop\Scripts\mupdf\mutool.exe clean $args }

# Replaces $PATH with the current system envirnment path. Saves you from rebooting if PS is refusing to fetch the new one.
Chuck-Progress "Adding Refresh-Path"
function Refresh-Path { $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") }

# Nice alias for Which (UNIX command) that tells you where a file in $PATH is located.
Chuck-Progress "Adding Python Virtual Environments"

# Add Py VEnv
New-Alias activate ./VirtualEnv/Scripts/activate.ps1
Chuck-Progress "Adding Which"
function which([string]$cmd) {Get-Command -ErrorAction "SilentlyContinue" $cmd | Format-Table Definition}

# [Diceware](https://makemeapassword.ligos.net/) with random delimiters 
Chuck-Progress "Adding Diceware"
function diceware {
  if ($args -like "*-h*") {
    & "C:\Users\Manu\Desktop\Random stuffs\passgen\PassphraseGenerator.exe" $args
  }
  else {
    $special_chars = "~!#$%^&*()-=+[]\{}:;\```"'<>?/"
    $rand_char_index = Get-Random -Minimum 0 -Maximum ($special_chars.length - 1)
    $rand_char = $special_chars[$rand_char_index]
    $delimiter = " " + $rand_char + " "
    $password = & "C:\Users\Manu\Desktop\Random stuffs\passgen\PassphraseGenerator.exe" --strength insane -c 1 --spaces true --mutUpper startofword --mutUpperCount 9999 --mutNumeric startorendofword --separator $delimiter $args
    Set-Clipboard $password.split([Environment]::NewLine)[8]
    Write-Output $password
  }
}

Chuck-Progress "Adding Chocolatey"
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Chuck-Progress "Adding VSCode"
function code{
  & "C:/Program` Files/Microsoft` VS` Code/Code.exe " $args
}

Chuck-Progress "Adding Sublime Text"
function sublime{
  & "C:\Program Files\Sublime Text 3\sublime_text.exe" $args
}

# Sets prompt to be in Unicode. Allows Vim Powerline fancy symbols.
Chuck-Progress "Changing Format to Unicode"
chcp 65001

Chuck-Progress "Adding Sudo"
function sudo(){
  if ($args.Length -eq 1){
    start-process $args[0] -verb "runAs"
  }
  if ($args.Length -gt 1){
    start-process $args[0] -ArgumentList $args[1..$args.Length] -verb "runAs"
  }
  if ($args.Length -eq 0){
    start-process powershell -verb "runAs"
  }
}
