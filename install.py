#!/usr/bin/env python

import sys

def main():
    os_type = sys.platform
    if os_type.startswith('darwin'):
        return macOS()
    elif os_type.startswith('win32'):
        return windows()
    elif os_type.startswith('linux'):
        return linux()
    else:
        return 1

def macOS():
    return 1

def windows():
    return 1

def linux():
    return 1

if __name__ == "__main__":
    main()
