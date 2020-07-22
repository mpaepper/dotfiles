# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls 
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set prompt -> http://ezprompt.net/
export PS1="\[\e[32m\]\u\[\e[m\]\[\e[37;40m\]\w\[\e[m\]\[\e[32m\]\\$\[\e[m\] "

export EDITOR=vim

# added by Anaconda3 installer
export PATH="/home/marc/anaconda3/bin:$PATH"
. /home/marc/anaconda3/etc/profile.d/conda.sh

export PATH="/home/marc/.custom/bin:$PATH"

# Custom functions
# ----------------
for FUNCFILE in `find ~/.custom/functions/`
do
  [ -f "$FUNCFILE" ] && source "$FUNCFILE"
done

# Auto-completion
# ---------------
for COMPLETION in `find ~/.custom/completions/`
do
  [[ $- == *i* ]] && source "$COMPLETION" 2> /dev/null
done

# Key bindings
# ------------
for KEYBINDING in `find ~/.custom/keybindings/`
do
  [ -f "$KEYBINDING" ] && source "$KEYBINDING"
done

GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh

stty -ixon # Don't hang on Ctrl+S in terminals

set -o vi # Use vim bindings for terminal
