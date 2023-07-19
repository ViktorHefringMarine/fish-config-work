function git-c-n
    git log --reverse --pretty=%H refactoring+benchmarks | grep -A 1 $(git rev-parse HEAD) | tail -n1 | xargs git checkout -q
    git log -1
end

function git-c-p
    git checkout -q HEAD^1
    git log -1
end

function git-is-merged --wraps git
    echo "last commit: $(git log --format=%H -n 1 $argv)"
    # echo "- $argv -"
    echo "merge-base:  $(git merge-base $argv wbv)"
end

function git-log-branches --wraps git
    git log --graph --pretty='%Cred%h%Creset - %s %Cgreen(%cr)  %C(bold blue)%d%Creset %Creset' --color=always | grep -w origin --color=never
end

function git-log-tree --wraps git
    git log --graph --pretty='%Cred%h%Creset - %s %Cgreen(%cr)  %C(bold blue)%d%Creset %Creset' --color=always $argv
end
