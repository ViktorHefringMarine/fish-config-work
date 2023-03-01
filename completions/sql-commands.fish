function __tmuxinator_list_commands
    string match -v -r '^\s*#' <~/.config/fish/completions/tmuxinator/commands_descriptions | while read -l line
        string split -f 1,2 : -- $line | string join \t | string replace -r ',.*' ''
    end
end

function echo_files_in_dirs
    set --path XX  \
        ~/hm/research/queries \
        # ~/hm/research/queries

    set out (fdfind --full-path . $XX -e sql)
    echo $out
end

function __list_files
    for x in (string split " " -- $(echo_files_in_dirs))
        echo $x
    end
end

__list_files
# set val $(echo_files_in_dirs)
# echo "====================="
# echo $val

# complete -f -c $__fish_tmuxinator_program_cmd -n '__fish_tmuxinator_with_no_sub_arguments' -x -a "(__tmuxinator_list_commands)"
complete -f -c sql-commands -a "(__list_files)"
