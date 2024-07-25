
complete -x -c venv \
    -n '__fish__command_has_no_argument' \
    -a "create \
        source \
        delete" 

function venv
    if not set -q argv[1]
        # Missing argument `create` or `source`
        echo "Usage: venv [create|source|delete]"
        return 1
    else if test $argv[1] != "create" \
        &&  test $argv[1] != "source" \
        &&  test $argv[1] != "delete"
        # Invalid argument
        echo "Usage: venv [create|source|delete]"
        return 1
    end

    set -f cmd $argv[1] 

    if test $cmd = "create"
        python3 -m venv .venv
        source .venv/bin/activate.fish
    else if test $cmd = "source"
        source .venv/bin/activate.fish
    else if test $cmd = "delete"
        rm -rd .venv
    end
end
