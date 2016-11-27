# Useful post processor - github/mdhiggins/sickbeard_mp4_automater
function MP4automater { py -2 C:\MP4Automater\manual.py $args }
# Removes PDF restrictions - mupdf.com
function PDFClean { C:\Users\Manu\Desktop\Scripts\mupdf\mutool.exe clean $args }
# Replaces $PATH with the current system envirnment path. Saves you from rebooting if PS is refusing to fetch the new one.
function Refresh-Path { $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") }
# Makes working with Python palatable on Windows: makes the Activate command of VirtualEnv work.
New-Alias activate ./VirtualEnv/Scripts/activate.ps1
# Nice alias for Which (UNIX command) that tells you where a file in $PATH is located.
function which([string]$cmd) {gcm -ErrorAction "SilentlyContinue" $cmd | ft Definition}function which([string]$cmd) {gcm -ErrorAction "SilentlyContinue" $cmd | ft Definition}
# Alias for setting origins for a git repository
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
}
# Sets prompt to be in Unicode. Allows Vim Powerline fancy symbols.
chcp 65001
