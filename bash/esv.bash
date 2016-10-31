
function rbt-post {
    from_branch="default"
    to_branch="."
    if [[ $# -gt 0 && "$1" != -* ]]; then
        from_branch="$1"
        shift
    fi
    if [[ $# -gt 0 && "$1" != -* ]]; then
        to_branch="$1"
        shift
    fi
    TO_HASH=$(hg log -r "$to_branch" --template '{node}\n')
    FROM_HASH=$(hg log -r "$from_branch" --template '{node}\n')
    TO_REV=$(hg log -r "$to_branch" --template '{rev}\n')
    FROM_REV=$(hg log -r "$from_branch" --template '{rev}\n')
    shift 2
    options="$@"

    if [ ! -e "./.reviewboardrc" ] || [ -z "$(grep ^REPOSITORY ./.reviewboardrc)" ]; then
        REPOSITORY=${PWD##*/}
        echo "[warning] no repository found in .reviewboardrc; using folder name '$REPOSITORY'"
        options="$options --repository $REPOSITORY"
    fi

    echo "Posting revisions $FROM_REV:$TO_REV (${FROM_HASH:0:12}:${TO_HASH:0:12})"
    rbt post $options $FROM_HASH $TO_HASH
}

# ReviewBoard Tools shortcuts (bash version). Add to your ~/.bashrc
function rbt-post-branch {
    rbt-post "parents(min(branch(($(hg branch)))))" . $@
}

# To post a review of default's head to your current branch's head
#   useful if you've merged default into your branch
function rbt-post-branch-head {
    rbt-post default . $@
}

function rbt-post-uncommitted {
    hg diff | rbt post --diff-filename=- "$@"
}
