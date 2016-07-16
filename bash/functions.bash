#!/bin/bash

git_num_untracked_files() {
  expr `git status --porcelain 2>/dev/null| grep "^??" | wc -l`
}

git_status_indicator() {
    if ! git diff-index --quiet HEAD --; then
        echo '!'
    elif [[ git_num_untracked_files > 0 ]]; then
        echo '?'
    fi
}
#used in the prompt command below to display what git branch i'm in.
git_ps1() {
    GIT_BRANCH=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/")
    if [[ -n "$GIT_BRANCH" ]]; then
        echo " $Yellow($Purple$GIT_BRANCH$IBlue$(git_status_indicator)$Yellow)"
        # echo " ($GIT_BRANCH)"
    fi
}

hg_ps1() {
    # hg prompt "({[+{incoming|count}]-->}{root|basename}{/{branch}}{-->[+{outgoing|count}]}{ at {bookmark}}{status})" 2> /dev/null
    # hg prompt " ({on {branch}}{ at {bookmark}}){status}" 2> /dev/null
    hg prompt " $Yellow($Purple{branch}{ at {bookmark}}$IBlue{status}$Yellow)" 2> /dev/null
}

listening () {
    if [ -z "$1" ]
    then
        lsof -n -i4TCP:8080 | grep LISTEN
    else
        lsof -n -i4TCP:$1 | grep LISTEN
    fi
}
