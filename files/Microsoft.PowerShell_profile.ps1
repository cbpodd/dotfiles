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

Function Make-Jobs {
    make -j$(nproc)
}

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
    Git-Add
    Git-Commit "Default Commit Message"
    Git-Push
}

Function Python-Server {
    python -m http.server 4444
}

# Overwrites of Existing Commands for better defaults
New-Alias -Name make -Value Make-Jobs

# Moving and Copying of Direcories
New-Alias -Name cpd -Value Copy-Recurse
New-Alias -Name rmd -Value Remove-Directory-Force

# Common Flags
New-Alias -Name la -Value List-All

# Git
New-Alias -Name ga -Value Git-Add-Dot
New-Alias -Name gtcm -Value Git-Commit-Message
New-Alias -Name gs -Value Git-Status
New-Alias -Name gpl -Value Git-Pull
New-Alias -Name gph -Value Git-Push
New-Alias -Name gb -Value Git-Branch
New-Alias -Name gch -Value Git-Checkout
New-Alias -Name ggraph -Value Git-Graph
New-Alias -Name gdcm -Value Git-Default-Commit

# Common Vim Commands
New-Alias -Name :e -Value vim
New-Alias -Name :q -Value exit

# Python
New-Alias -Name pserver -Value Python-Server
New-Alias -Name py -Value python
New-Alias -Name p3 -Value python

# Others
# New-Alias -Name rq -Value 'sed -E "s/\"//g"'
# New-Alias -Name preview -Value 'open -a "Preview.app"'
