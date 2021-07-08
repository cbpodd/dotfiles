# Vim Mode
# First time install
# Install-Package -Name PSReadline
# PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force

# Modules
Import-Module posh-git
Set-PSReadlineOption -EditMode vi
Set-PSReadlineOption -ViModeIndicator Prompt

# Add secrets to path not to be checked into source control
. $HOME\.MicrosoftSpecific.PSProfile.ps1
. $HOME\.Secret.PSProfile.ps1

# Microsoft-Specific (To be hidden in another file)
$vms = @("IRVM01", "IRVM02", "IRVM03")
$azs = "$HOME\one\AzureStack\Infrastructure\Orchestration"
$gb = 'users/t-capodd'

# Path variables
$repos = "$HOME\repos"
$go = "$HOME\go"
$ONEDRIVE = "$HOME\OneDrive"
$od = $ONEDRIVE
$shared = "$ONEDRIVE\shared"
$money = "$shared\camalina\money"
$mymoney = "$money\cam"

# Left Prompt (git, path, powershell)
function Prompt
{
    # First Line
    Write-Host 'PS ' -NoNewline -ForegroundColor White # Prompt Type
    Write-Host "$ENV:UserName @ " -NoNewline -ForegroundColor Blue # Current User
    Write-Host "$(Get-Location) " -NoNewline -ForegroundColor Green # Present Working Directory
    # Write-Host "$(Get-Date)" -NoNewline -ForegroundColor Yellow # Current date/time
    if ($LastExitCode -ge 1)  { # Exit code of the last command, if not 0
            Write-Host " $LastExitCode" -NoNewLine -ForegroundColor Red
    }     #) +
    Write-VcsStatus
    Write-Host " " -NoNewLine # Space

    # Second Line
    $(if ($NestedPromptLevel -ge 1) {
        Write-Host '>' -NoNewLine -ForegroundColor White
    })
    return '> ' # Last arrow
}

# Fix internet connection issues
function Fix-InternetIssues
{
    netsh winsock reset
    netsh int ip reset
    ipconfig /release
    ipconfig /renew
    ipconfig /flushdns
}

# sudo - must put command in quotes TODO: remove quotes from string
function sudo([string] $command)
{
    Start-Process -Verb RunAs powershell.exe -Args "-executionpolicy bypass -command Set-Location \`"$PWD\`"; $command"
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile))
{
  Import-Module "$ChocolateyProfile"
}

# Aliases

# Functions to be aliased
function List-All
{
    ls -Force
}

function Copy-Recurse([string] $Path, [string]$Destination)
{
    Copy-Item -Path $Path -Destination $Destination -Recurse
}

function Remove-Directory-Force([string]$Path)
{
    Remove-Item -Path $Path -Recurse -Force
}

function Git-Add-Dot
{
    git add .
}

function Git-Commit-Message([string] $message)
{
    git commit -m $message
}

function Git-Status
{
    git status
}

function Git-Push
{
    git push
}

function Git-Branch
{
    git branch
}

function Git-Checkout
{
    git checkout
}

function Git-Pull
{
    git pull
}

function Git-Graph
{
    git log --oneline --graph --decorate --all
}

function Git-Default-Commit
{
    git add .
    git commit -m "Default Commit Message"
    git push
}

function Git-Add-Commit-Push([string] $message)
{
    git add .
    git commit -m $message
    git push
}

function Python-Server
{
    python -m http.server 4444
}

function Create-File([string] $path)
{
    New-Item -Path $path -ItemType File
}

function Vim-VimRC
{
    vim ~/.vimrc
}

function Open-Powershell-Profile
{
    vim ~/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1
}

Function Run-AutoHotkey {
    ~/repos/dotfiles/files/default.ahk
}

Function Get-Web-Content([string] $url) {
    Invoke-WebRequest $url -useBasicParsing | Select-Object -Expand Content
}

Function Docker-Compose-Down() {
    docker-compose down
}

function Docker-Compose-Up() {
    docker-compose up -d --build
}

function Docker-Compose() {
    Docker-Compose-Down
    Docker-Compose-Up
}

# docker-compose
New-Alias -Name dcd -Value Docker-Compose-Down
New-Alias -Name dcu -Value Docker-Compose-Up
New-Alias -Name dc -Value Docker-Compose

# Overwrites of Existing Commands for better defaults
# New-Alias -Name make -Value Make-Jobs
function Get-Web-Content([string] $url)
{
    Invoke-WebRequest $url -useBasicParsing | Select-Object -Expand Content
}

function Change-Dir-Back([int] $Number = 1)
{
    $base = "../"
    $Path = ""
    for ($i = 0; $i -lt $Number; $i++) {
        $path += $base
    }

    Set-Location -Path $Path
}

function Run-AutoHotKey
{
    ~\repos\dotfiles\files\default.ahk
}

function Tree-File
{
    tree /f
}

function Restart-WSL
{
    Get-Service LxssManager | Restart-Service
}

function Expand-NuGet([string] $NuGet, [string] $FolderName = "")
{
    [System.Collections.ArrayList]$NuGetArray = $NuGet.Split(".")
    $NuGetArray.Remove("nupkg")
    $BaseArray = $NuGetArray.Clone()
    $ZipArray = $BaseArray.Clone()
    $ZipArray.Add("zip")
    $Zip = $ZipArray -join "."
    Copy-Item $NuGet $Zip

    if ($FolderName -eq "")
    {
        $FolderName = $BaseArray -join "."
    }

    Expand-Archive $Zip $FolderName
}

# Unix Replacements
New-Alias -Name web -Value Get-Web-Content
New-Alias -Name uniq -Value Get-Unique
New-Alias -Name grep -Value Select-String

# Moving and Copying of Direcories
New-Alias -Name cpd -Value Copy-Recurse
New-Alias -Name rmd -Value Remove-Directory-Force
New-Alias -Name touch -Value Create-File

# Common Flags
New-Alias -Name la -Value List-All
New-Alias -Name cdb -Value Change-Dir-Back
New-Alias -Name treef -Value Tree-File

# Git
New-Alias -Name ga -Value Git-Add-Dot
New-Alias -Name gtcm -Value Git-Commit-Message
New-Alias -Name gacp -Value Git-Add-Commit-Push
New-Alias -Name gs -Value Git-Status
New-Alias -Name gpl -Value Git-Pull
New-Alias -Name gph -Value Git-Push
New-Alias -Name gb -Value Git-Branch
New-Alias -Name gch -Value Git-Checkout
New-Alias -Name ggraph -Value Git-Graph
New-Alias -Name gdcm -Value Git-Default-Commit

# Common Vim Commands
New-Alias -Name :e -Value vim

# Open Profile Files
New-Alias -Name vimrc -Value Vim-VimRC
New-Alias -Name psprof -Value Open-Powershell-Profile
New-Alias -Name psprofile -Value Open-Powershell-Profile
New-Alias -Name ahk -Value Run-AutoHotKey

# Python
New-Alias -Name pserver -Value Python-Server
New-Alias -Name py -Value python
New-Alias -Name p3 -Value python

# Others
New-Alias -Name open -Value Start-Process
New-Alias -Name wg -Value winget
