

function fish_prompt
    set last_status $status

    echo ' '

    set user (whoami)

    set_color magenta
    printf '%s' $user
    set_color normal


    # printf ' in '
    printf ' '
    set_color $fish_color_cwd
    printf '%s' (echo $PWD | sed -e "s|^$HOME|~|" -e 's|^/private||' -e 's|~/Projects/liveblocks/||')
    set_color normal

    git_prompt
    echo

    set_color normal
    printf '(%s)' (date +%H:%M)

    if test $last_status -ne 0
        set_color white -o
        printf '[%d] ' $last_status
        set_color normal
    end
    printf ' $ '

    set_color normal
end

function demo-mode
    function fish_prompt
        set last_status $status
        printf '$ '
    end
end

function git_current_branch -d 'Prints a human-readable representation of the current branch'
    set -l ref (git symbolic-ref HEAD 2>/dev/null; or git rev-parse --short HEAD 2>/dev/null)
    if test -n "$ref"
        echo $ref | sed -e s,refs/heads/,,
        return 0
    end
end

function git_prompt
    if git rev-parse --show-toplevel >/dev/null 2>&1
        set_color normal
        printf ' on '
        set_color yellow
        printf '%s' (git_current_branch)
        set_color green
        #git_prompt_status
        set_color normal
    end
end
