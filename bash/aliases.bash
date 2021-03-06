#!/bin/bash

# some more ls aliases
alias ll='ls -halF'
alias la='ls -A'
alias lla='ls -AhalF'
alias l='ls -CF'
alias lu='du -hd 1'

################
# System Aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Find files by name
alias findname='find . -name'

# Force emacs to open inline
alias emacs='emacs -nw'

# When do i not want it to be human readable?
alias du='du -h'

# I Do lots of pogo queries and would like to pipe the output to a formatting script.
# This tells wget to output the result (what would normally go into file.html) out to the screen.
alias wget='wget -O - '

# Useful utility for sending files to trash from command line instead of
# permanently deleting with rm - see http://code.google.com/p/trash-cli/
#alias tp='trash-put'


###############
# Maven aliases
# alias mvno='mvn -o'
alias mvninstall='mvnrun; mvn clean install -DskipTests -DskipJspc'
# alias mvnoall='mvnrun; mvno clean install -Dmaven.test.skip=true; mvndbg'
# alias mvneclipse='mvn -P -testResources eclipse:clean eclipse:eclipse;'
# alias mvnoeclipse='mvno -P -testResources eclipse:clean eclipse:eclipse;'
# alias jettyrun='mvn jetty:run'
# alias jettycleanrun='mvn clean jetty:run'
# alias mvncc='rm cp.txt; mvn clean compile; touch lastrun.dat;'
# alias mvnc='mvn compile; touch lastrun.dat;'
# alias mvnoff='zb mvn run && zb mvn jrebeloff;'

############
# Navigation
alias ..='cd ..'

############
# startup aliases
alias start_http='python -m SimpleHTTPServer 8000';

############
# Python dev
# alias tg_start='../bin/paster serve --reload development.ini'

############
# Git Aliases
alias gs='git status'
# alias ga='git add '
ga () { git add "$@" && git status; }
alias gaa='git add -A && git status'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gf='git fetch -p && git fetch origin master:master'
alias gmm='gf && git merge master'
alias grm='gf && git rebase master'
alias gprune_list='git branch -r | awk '"'"'{print $1}'"'"' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '"'"'{print $1}'"'"
alias gprune_delete='gprune_list | xargs git branch -d'
alias gprune_fdelete='gprune_list | xargs git branch -D'

#############
# Hg Aliases
alias hs='hg status'
alias hd='hg diff -r default -r tip'
# clone an EnergySavvy repo
# alias hc='hg clone'

function hc {
  echo "cloning ssh://repo.evoworx.org/$1";
  hg clone ssh://evo/$1;
}

###############
# Miscellaneous
alias ios='/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/Contents/MacOS/Simulator -psn_0'
alias npm-exec='PATH=$(npm bin):$PATH'
