#!/bin/bash

# Terminate script after first line that fails
set -e

# VDMJ URL
vdmj_url=https://github.com/nickbattle/vdmj/releases/download/4.3.0-1/vdmj-4.3.0-P-190919.jar

# Check if Emacs is installed
if ! [ -x "$(command -v emacs)" ]; then
    printf 'Emacs is not available. Quitting...\n'
    exit 1
fi

# Check if Java is installed
if ! [ -x "$(command -v java)" ]; then
    printf 'Java is not available (VDMJ dependency). Quitting...\n'
    exit 1
fi

# Update the home folder to the current directory so that we can run
# Emacs in an isolated environment
export HOME=$(readlink -f .)
echo $HOME

# Download VDMJ, if needed
wget -nc $vdmj_url -O vdmj.jar

# Install Emacs packages
emacs -nw -batch -l .emacs.d/init.el -kill

# Run emacs
emacs

exit 0
