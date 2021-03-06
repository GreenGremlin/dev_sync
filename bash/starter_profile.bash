export SYNC_DIR="$HOME/code/dev_sync"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# export JAVA_HOME="$(/usr/libexec/java_home -v 1.7)"

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# export PATH

if [ -f "$SYNC_DIR/bash/profile.bash" ]; then
    . "$SYNC_DIR/bash/profile.bash"
fi

# The next line updates PATH for the Google Cloud SDK.
# if [ -f ~/google-cloud-sdk/path.bash.inc ]; then
#     . ~/google-cloud-sdk/path.bash.inc
# fi

# The next line enables bash completion for gcloud.
# if [ -f ~/google-cloud-sdk/completion.bash.inc ]; then
#     . ~/google-cloud-sdk/completion.bash.inc
# fi
