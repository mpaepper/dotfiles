# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/.xmonad/bin:$HOME/.cabal/bin:$HOME/bin:$HOME/.local/bin:$HOME/.custom/bin:$PATH"

export _JAVA_AWT_WM_NONREPARENTING=1 # Fix Java // Webstorm etc for xmonad
#xprop -root -remove _NET_WORKAREA # MP Fix chrome for xmonad, see https://github.com/xmonad/xmonad/issues/42

export TERM='xterm-256color'
export GOPATH=$HOME/go_work
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
