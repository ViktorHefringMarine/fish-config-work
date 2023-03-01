function __tmuxinator_list_commands
    string match -v -r '^\s*#' <~/.config/fish/completions/tmuxinator/commands_descriptions | while read -l line
        string split -f 1,2 : -- $line | string join \t | string replace -r ',.*' ''
    end
end

set __fish_tmuxinator_program_cmd (commandline -o)[1]

function __fish_tmuxinator_program
  eval "$__fish_tmuxinator_program_cmd $argv"
end

function __fish_tmuxinator_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]

    for COMMAND in [ "start" "stop" "edit" "open" ]
        if [ $COMMAND = $cmd[2] ]
            return 0
        end
    end
  end
  return 1
end

function __fish_tmuxinator_with_no_sub_arguments 
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    return 1
  end
  return 0
end

complete -f -c $__fish_tmuxinator_program_cmd -n '__fish_tmuxinator_with_no_sub_arguments' -x -a "(__tmuxinator_list_commands)"
complete -f -c $__fish_tmuxinator_program_cmd -n '__fish_tmuxinator_using_command' -x -a "(ls ~/.config/tmuxinator/ | cut -d . -f 1)"

