#!/usr/bin/env python3

import sys
import json
import os
from pathlib import Path
from urllib.request import urlretrieve as wget

WINDOWS = 'windows'
LINUX = 'linux'
MACOS = 'macos'
UNIX = 'unix'
FILES_DIR = 'files'
CONFIG_DIR = 'config'
VSCODE_DIR = 'vscode'
HOME = str(Path.home())
CWD = os.getcwd()
CODEWINDOWS = os.path.join(HOME, "AppData", "Roaming", "Code - Insiders", "User")
CODEMACOS = os.path.join(HOME, "Library", "Application Support", "Code", "User")

def main():
    with open('data.json') as f:
        data = json.load(f)
        os_type = sys.platform
        platform_name = ''
        fs_type = UNIX
        if os_type.startswith('darwin'):
            setupVSCode(CODEMACOS)
            platform_name = MACOS
        elif os_type.startswith('win32'):
            platform_name = WINDOWS
            setupVSCode(CODEWINDOWS)
            fs_type = WINDOWS
        elif os_type.startswith('linux'):
            platform_name = LINUX

        files = data['files']['shared'] + data['files'][platform_name]
        folders = data['folders']['shared'] + data['folders'][platform_name]
        config = data['config']['shared'] + data['config'][platform_name]
        sbinFiles = data['sbin']['shared'] + data['sbin'][platform_name]


        if fs_type == UNIX:
            return unix(files, folders, config, sbinFiles)

        return windows(files, folders, config, sbinFiles)

def setupVSCode(CODE):
    repoDir = os.path.join(CWD, VSCODE_DIR)
    for f in os.listdir(repoDir):
        fullPath = os.path.join(CWD, VSCODE_DIR, f)
        codePath = os.path.join(CODE, f)
        if os.path.exists(fullPath) and not os.path.exists(codePath):
            os.symlink(fullPath, codePath)

def unix(files, folders, config, sbinFiles):
    linkFiles(files)
    linkFolders(folders)
    populateConfig(config)
    populateSbin(sbinFiles)
    return 0

def windows(files, folders, config, sbin):
    for f in files:
        fullPath = os.path.join(CWD, FILES_DIR, f)
        hf = hidden(f, UNIX)
        homePath = os.path.join(HOME, hf)
        actualPath = None
        if f == 'Microsoft.PowerShell_profile.ps1':
            actualPath = os.path.join(HOME, 'Documents', 'WindowsPowerShell', f)
        elif f == "wtprofile.json":
            actualPath = os.path.join(HOME, "AppData", "Local", "Packages", \
                    "Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe", "LocalState", \
                    "settings.json")
        if actualPath and os.path.isfile(fullPath) and not os.path.isfile(actualPath):
                os.symlink(fullPath, actualPath)
        if os.path.isfile(fullPath) and not os.path.isfile(homePath):
            os.symlink(fullPath, homePath)
    linkFolders(folders)
    populateSbin(sbin)
    return 0

def linkFiles(files):
    for f in files:
        fullPath = os.path.join(CWD, FILES_DIR, f)
        hf = hidden(f, UNIX)
        homePath = os.path.join(HOME, hf)
        if os.path.isfile(fullPath) and not os.path.isfile(homePath):
            os.symlink(fullPath, homePath)

def populateConfig(config):
    hiddenConfig = hidden(CONFIG_DIR, UNIX)
    configPath = os.path.join(HOME, hiddenConfig)
    if not os.path.isdir(configPath):
        os.makedirs(configPath)
    for c in config:
        fullPath = os.path.join(CWD, CONFIG_DIR, c)
        homePath = os.path.join(configPath, c)
        if os.path.exists(fullPath) and not os.path.exists(homePath):
            os.symlink(fullPath, homePath)

def populateSbin(sbinFiles):
    sbinPath = os.path.join(HOME, 'sbin')
    if not os.path.isdir(sbinPath):
        os.makedirs(sbinPath)
    for obj in sbinFiles:
        url = obj['url']
        name = obj['name']
        destination = os.path.join(sbinPath, name)
        wget(url, destination)
        os.chmod(destination, 0o775)

def linkFolders(folders):
    for folder in folders:
        fullPath = os.path.join(CWD, folder)
        hf = hidden(folder, UNIX)
        homePath = os.path.join(HOME, hf)
        if os.path.isdir(fullPath) and not os.path.isdir(homePath):
            os.symlink(fullPath, homePath)


def hidden(f, fs_type):
    if fs_type == UNIX:
        return "." + f

    return "_" + f

if __name__ == "__main__":
    exit_code = main()
    sys.exit(exit_code)
