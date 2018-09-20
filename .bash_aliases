alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias lart='ls -lArth'

# Add an "alert" alias for long running commands.  Use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# -----------------------------
# 1.  MAKE TERMINAL BETTER
# -----------------------------

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias wget='wget -c'                        # Preferred 'wget' implementation (resume download)
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias dud='du -d 1 -h'                      # Short and human-readable file listing
alias duf='du -slh *'                       # Short and human-readable directory listing
alias ~="cd ~"                              # ~:            Go Home
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias h='fc -l 1 | grep $1'                 # h:            Find an executed command in .bash_history

# lr:  Full Recursive Directory Listing
# ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# ---------------------------
# 2.  PROCESS MANAGEMENT
# ---------------------------

# memHogs:  Find memory hogs
# -----------------------------------------------------
alias memHogs='htop -s PERCENT_MEM'

# cpuHogs:  Find CPU hogs
# -----------------------------------------------------
alias cpuHogs='htop -s PERCENT_CPU'
