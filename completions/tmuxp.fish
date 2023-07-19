function __tmuxp_list_commands
    string match -v -r '^\s*#' <~/.config/fish/completions/tmuxp/commands_descriptions | while read -l line
        string split -f 1,2 : -- $line | string join \t | string replace -r ',.*' ''
    end
end

set __fish_tmuxp_program_cmd (commandline -o)[1]

function __fish_tmuxp_program
  eval "$__fish_tmuxp_program_cmd $argv"
end

function __fish_tmuxp_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]

    for COMMAND in [ "load" ]
        if [ $COMMAND = $cmd[2] ]
            return 0
        end
    end
  end
  return 1
end

function __fish_tmuxp_with_no_sub_arguments 
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    return 1
  end
  return 0
end

complete -f -c $__fish_tmuxp_program_cmd -n '__fish_tmuxp_with_no_sub_arguments' -x -a "(__tmuxp_list_commands)"
complete -f -c $__fish_tmuxp_program_cmd -n '__fish_tmuxp_using_command' -x -a "(ls ~/.config/tmuxp/ | cut -d . -f 1)"

