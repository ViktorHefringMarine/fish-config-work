
function __echo_files_in_dirs_projectionist
    set --path XX  \
        ~/.config/fish/data 
        # ~/hm/research/queries
    set out (fd --hidden --base-directory $XX )
    echo $out
end

function __list_files_projectionist
    for x in (string split " " -- $(__echo_files_in_dirs_projectionist))
        set name_without_dot_prefix (string sub --start=2 $x)
        echo $name_without_dot_prefix
    end
end

function __fish__command_has_no_argument
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 ]
    return 0
  end
  return 1
end


complete -x -c projectionist \
    -n '__fish__command_has_no_argument' \
    -a "(__list_files_projectionist)"



function projectionist 
    # If argument is missing
    if not set -q argv[1]
        echo "Missing an input"
        return
    end

    cp "$HOME/.config/fish/data/.$argv[1]" ./.projections.json
end

