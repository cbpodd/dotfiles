# Vim Mode
# First time install
# Install-Package -Name PSReadline
# PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force

Import-Module posh-git
Set-PSReadlineOption -EditMode vi
Set-PSReadlineOption -ViModeIndicator Prompt

# Left Prompt (git, path, powershell)
function Prompt {
    # First Line
    Write-Host 'PS ' -NoNewline -ForegroundColor White # Prompt Type
    Write-Host "$ENV:UserName @ " -NoNewline -ForegroundColor Blue # Current User
    Write-Host "$(Get-Location) " -NoNewline -ForegroundColor Green # Present Working Directory
    Write-Host "$(Get-Date)" -NoNewline -ForegroundColor Yellow # Current date/time
    if ($LastExitCode -ge 1)  { # Exit code of the last command, if not 0
            Write-Host " $LastExitCode" -NoNewLine -ForegroundColor Red
    }     #) + 
    Write-VcsStatus
    Write-Host "" # Newline

    # Second Line
    $(if ($NestedPromptLevel -ge 1) {
        Write-Host '>' -NoNewLine -ForegroundColor White
    })
    return '> ' # Last arrow
}

# sudo - must put command in quotes TODO: remove quotes from string
Function sudo([string] $command) {
    Start-Process -Verb RunAs powershell.exe -Args "-executionpolicy bypass -command Set-Location \`"$PWD\`"; $command"
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Aliases

# Functions to be aliased
Function List-All {
    ls -Force
}

# Function Make-Jobs {
#     make -j$(nproc)
# }

Function Copy-Recurse([string] $Path, [string]$Destination) {
    Copy-Item -Path $Path -Destination $Destination -Recurse
}

Function Remove-Directory-Force([string]$Path) {
    Remove-Item -Path $Path -Recurse -Force
}

Function Git-Add-Dot {
    git add .
}

Function Git-Commit-Message([string] $message) {
    git commit -m $message
}

Function Git-Status {
    git status
}

Function Git-Push {
    git push
}

Function Git-Branch {
    git branch
}

Function Git-Checkout {
    git checkout
}

Function Git-Pull {
    git pull
}

Function Git-Graph {
    git log --oneline --graph --decorate --all
}

Function Git-Default-Commit {
    git add .
    git commit -m "Default Commit Message"
    git push
}

Function Git-Add-Commit-Push([string] $message) {
    git add .
    git commit -m $message
    git push
}

Function Python-Server {
    python -m http.server 4444
}

Function Create-File([string] $path) {
    New-Item -Path $path -ItemType File
}

Function Vim-VimRC {
    vim ~/.vimrc
}

Function Open-Powershell-Profile {
    vim ~/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1
}

Function Get-Web-Content([string] $url) {
    Invoke-WebRequest $url -useBasicParsing | Select-Object -Expand Content
}

# Overwrites of Existing Commands for better defaults
# New-Alias -Name make -Value Make-Jobs

# Unix Replacements
New-Alias -Name web -Value Get-Web-Content
New-Alias -Name uniq -Value Get-Unique
New-Alias -Name grep -Value rg

# Moving and Copying of Direcories
New-Alias -Name cpd -Value Copy-Recurse
New-Alias -Name rmd -Value Remove-Directory-Force
New-Alias -Name touch -Value Create-File

# Common Flags
New-Alias -Name la -Value List-All

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

# Python
New-Alias -Name pserver -Value Python-Server
New-Alias -Name py -Value python
New-Alias -Name p3 -Value python

# Others
New-Alias -Name open -Value Start-Process
