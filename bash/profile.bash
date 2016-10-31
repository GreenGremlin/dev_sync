
# $HOME/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
export BASH_CONF="bash_profile"

export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export WORKON_HOME=$HOME/.virtualenvs
[[ -r "$HOME/bin/virtualenvwrapper_lazy.sh" ]] && . "$HOME/bin/virtualenvwrapper_lazy.sh"

[[ -r "$SYNC_DIR/bash/colors.bash" ]] && . "$SYNC_DIR/bash/colors.bash"
[[ -r "$SYNC_DIR/bash/functions.bash" ]] && . "$SYNC_DIR/bash/functions.bash"
[[ -r "$SYNC_DIR/bash/aliases.bash" ]] && . "$SYNC_DIR/bash/aliases.bash"
[[ -r "$HOME/.iterm2_shell_integration.`basename $SHELL`" ]] && . "$HOME/.iterm2_shell_integration.`basename $SHELL`"

[[ -r "$SYNC_DIR/bash/esv.bash" ]] && . "$SYNC_DIR/bash/esv.bash"

#OS X specific
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

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

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [[ -r /etc/debian_chroot ]]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    color_prompt=yes;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

set_bash_ps1() {
  history -a
  PS1="$Blue\w$Purple$(git_ps1)$(hg_ps1)$Color_Reset\n$"
}

set_bash_ps1

# If an ssh client or connection
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    PS1="$Red\u$Color_Reset@$BRed\h$Color_Reset: $PS1"
fi

if [ -n "$debian_chroot" ]; then
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}$PS1"
fi
unset color_prompt force_color_prompt


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [[ "$OSTYPE" == "darwin"* ]]; then
    [ -r `brew --prefix`/etc/bash_completion ] && . `brew --prefix`/etc/bash_completion
else
    [[ -r /etc/bash_completion ]] && . /etc/bash_completion
fi

[[ -r $HOME/Scripts/.git-completion.bash ]] && . $HOME/Scripts/.git-completion.bash

# autocompletion
[[ -x "$(command -v grunt)" ]] && eval "$(grunt --completion=bash)"
[[ -x "$(command -v gulp)" ]] && eval "$(gulp --completion=bash)"
# [[ -x "$(command -v npm)" ]] && eval "$(npm --completion=bash)"

export EDITOR="vim"

[[ -r $HOME/bin/subl ]] && export VISUAL="$HOME/bin/subl"

# Sets the title of my terminal. This is important if you use tabs. Notice that the git branch
# is at the beginning
case "$TERM" in
xterm*|rxvt*)
    # PROMPT_COMMAND='echo -ne "\033]0;*$(git_ps1)$(pwd)\007"'
    PROMPT_COMMAND=set_bash_ps1
    ;;
*)
    ;;
esac

# [[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM
