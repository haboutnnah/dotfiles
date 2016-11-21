function MP4automater { py -2 C:\MP4Automater\manual.py $args }
function PDFClean { C:\Users\Manu\Desktop\Scripts\mupdf\mutool.exe clean $args }
function Refresh-Path { $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") }
New-Alias activate ./VirtualEnv/Scripts/activate.ps1
function which([string]$cmd) {gcm -ErrorAction "SilentlyContinue" $cmd | ft Definition}function which([string]$cmd) {gcm -ErrorAction "SilentlyContinue" $cmd | ft Definition}
chcp 65001
