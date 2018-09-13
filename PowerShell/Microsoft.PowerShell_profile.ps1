$percent = 0
function Chuck-Progress($operation){
  $total_lines = 10
  $percent = $percent + 1
  $percentage = [math]::truncate(($percent/$total_lines) * 100)
  Write-Progress -Activity "Loading Profile" -Status "Loading Profile" -PercentComplete $percentage -CurrentOperation $operation
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
# Alias for setting origins for a git repository
Chuck-Progress "Adding Setup-Git-Remotes"
function Setup-Git-Remotes {
$githubname = "tf2manu994"
$gitlabname = "tf2manu994"
$atlassianname = "tf2manu994"
$reponame = $args
git remote rm origin
git remote add origin git@${githubname}/${reponame}.git
git remote set-url --add --push origin git@github:${githubname}/${reponame}.git
git remote set-url --add --push origin git@gitlab:${gitlabname}/${reponame}.git
git remote set-url --add --push origin git@bitbucket:${atlassianname}/${reponame}.git
}# [Diceware](https://pypi.org/project/diceware/) with random delimiters 
Chuck-Progress "Adding Diceware"
function diceware {
  if ($args -like "*-h*") {
    diceware.exe $args
  }
  else {
    $special_chars = "~!#$%^&*()-=+[]\{}:;\```"'<>?/"
    $rand_char = Get-Random -Minimum 0 -Maximum ($special_chars.length -1)
    $password = diceware.exe --delimiter ($special_chars[$rand_char]) $args
    Write-Output $password
    Set-Clipboard $password
  }
}

# Chocolatey profile
Chuck-Progress "Adding Chocolatey"
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Chuck-Progress "Adding VSCode"
function code{
  & "C:/Program` Files/Microsoft` VS` Code/Code.exe $args"
}

# Sets prompt to be in Unicode. Allows Vim Powerline fancy symbols.
Chuck-Progress "Changing Format to Unicode"
chcp 65001
