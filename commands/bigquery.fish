set FD_COMMAND "fd"

function __fish__list_options
    string match -v -r '^\s*#' <$argv[1] | while read -l line
        string split -f 1,2 : -- $line | string join \t | string replace -r ',.*' ''
    end
end

set -l __queries "\
    available_trips_in_tables \
    time-ranges-of-trips-in-datasets"

# function __tmuxinator_list_commands
#     string match -v -r '^\s*#' <~/.config/fish/completions/tmuxinator/commands_descriptions | while read -l line
#         string split -f 1,2 : -- $line | string join \t | string replace -r ',.*' ''
#     end
# end
#
###############################################################################################################################
# COMPLETION
###############################################################################################################################
function echo_files_in_dirs
    set --path XX  \
        ~/hm/research/queries \
        # ~/hm/research/queries

    set out ($FD_COMMAND --full-path . $XX -e sql)
    echo $out
end

function __list_files
    for x in (string split " " -- $(echo_files_in_dirs))
        set filename (string split -r -m1 / $x)[2]
        set rootname (string split . $filename)[1]
        echo $rootname
    end
end

function __fish_tmuxinator_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]

    for COMMAND in (string split " " -- )
        if [ $COMMAND = $cmd[2] ]
            return 0
        end
    end
  end
  return 1
end

function __fish__command_has_no_argument
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 ]
    return 0
  end
  return 1
end

function __fish__has_argument
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
      if [ $argv[1] = "available_trips_in_tables" ]
          return 0
      end
  end
  return 1
end

function __fish__last_option_is
  set cmd (commandline -opc)

  if [ $cmd[-1] = $argv[1] ]
      return 0
  end

  # if [ (count $argv) -eq 2 ]; and [ (count $cmd) -gt 1 ]
  #     if [ $cmd[-2] = $argv[1] ]; and [ $cmd[-1] = $argv[2] ]
  #         return 0
  #     end
  # end
  return 1
end

function __fish__sub_command_is
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]; and [ $cmd[2] = $argv[1] ]
      return 0
  end
  return 1
end

function __fish__sub_command_completions
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 2 ]; return 0; end
  return 1
end

function __fish__is_option_set
  set cmd (commandline -opc)

  for arg in $argv
      set arg_is_used false
      for c in $cmd
          if [ $c = $arg ]
              set arg_is_used true
          end
      end
      if not $arg_is_used
          return 1
      end
  end
  return 0
end

function __fish__get_tables
    set cmd (commandline -opc)
    set x 1
    for c in $cmd
        if [ $c = "-d" ]
            break
        end
        set x (math $x + 1)
    end
    set dataset $cmd[(math $x + 1)]

    set -f directory "/home/viktor/.config/fish/commands/bigquery/descriptions/tables"
    mkdir -p $directory

    set -f filename "$directory/$dataset"

    if not test -e $filename
        set val "$(bq ls --format=prettyjson --project_id=mk2-prod $dataset | jq -r '.[].tableReference.tableId' ) "
        echo $val > "$filename"
    end
    cat $filename
end


# __list_files
# complete -f -c query -a "(__list_files)"

# complete 
# complete -x -c bigquery -n '__fish__last_option_is' -a $__queries
# complete -x -c bigquery -n '__fish__command_has_no_argument' -a $__queries
# complete -x -c bigquery -n '__fish__has_argument available_trips_in_tables' -s d -o datasets -a "(cat ~/.config/fish/commands/bigquery/datasets)"
# complete -x -c bigquery -n '__fish__command_has_no_argument' -s q -l query --description "The query to execute" -a $__queries
# complete -x -c bigquery -n '__fish__command_has_no_argument' -s l -l list --description "list something" -a "datasets"
# complete -x -c bigquery -n '__fish__last_option_is ' -r -s d -l datasets -a "(cat ~/.config/fish/commands/bigquery/datasets)"
# complete -x -c bigquery -n '__fish__last_option_is available_trips_in_tables -d' -r -s d -l datasets -a "(cat ~/.config/fish/commands/bigquery/datasets)"

complete -x -c bigquery -n '__fish__sub_command_is query' -n '__fish__sub_command_completions' -a "(__list_files)"
complete -x -c bigquery -n '__fish__sub_command_is edit' -n '__fish__sub_command_completions' -a "(__list_files)"
complete -x -c bigquery -n '__fish__sub_command_is new' -n '__fish__sub_command_completions'

complete -x -c bigquery -n '__fish__sub_command_is query' -n '__fish__last_option_is available_trips_in_tables'

complete -x -c bigquery -n '__fish__sub_command_is list' -n '__fish__sub_command_completions'


complete -x -c bigquery -n '__fish__command_has_no_argument' -a "query list"
complete -x -c bigquery -s P -l project_id -d "The Project ID" -a "mk2-test mk2-prod"
complete -x -c bigquery -s f -l format -d "Formatting Style" -a "(__fish__list_options ~/.config/fish/commands/bigquery/descriptions/format)"
complete -x -c bigquery -s d -l dataset -d "Select Dataset" -a "(__fish__list_options ~/.config/fish/commands/bigquery/descriptions/datasets)"
complete -x -c bigquery -s o -l overwrite -d "Overwrite Cache"
complete -x -c bigquery -s F -l filename -d "Save to filename (as csv)"

complete -x -c bigquery -n '__fish__is_option_set "-d" "list"' -s t -l table -a "(__fish__get_tables)"
complete -x -c bigquery -n '__fish__is_option_set "-d" "query"' -s t -l table -a "(__fish__get_tables)"
complete -x -c bigquery -n '__fish__is_option_set "-d" "query"' -s T -l trip_ids -d "filename containing the trip-ids"

complete -x -c bigquery -n '__fish__is_option_set "-d"' -s n -l table-names-only -d "Show Table names only"

complete -x -c bigquery -n '__fish__is_option_set "-F"' -s M -l max_rows -d "The maximum number of rows"
complete -x -c bigquery -n '__fish__is_option_set "--filename"' -s M -l max_rows -d "The maximum number of rows"

complete -x -c bigquery -n '__fish__is_option_set "-d" "-t" "list"' -s c -l columns -d "Show Columns"



###############################################################################################################################
# FUNCTION
###############################################################################################################################

function sql-commands
    argparse --name=my_function 'h/help' 'n/name=' -- $argv
    echo $_flag_name
end

function bigquery
    argparse 'd/dataset='\
        'P/project_id=' \
        'f/format=' \
        'c/columns' \
        'n/table-names-only' \
        't/table=' \
        'o/overwrite' \
        'F/filename=' \
        'M/max_rows=' \
        'T/trip_ids=' \
        -- $argv
    
    set -f sub_command $argv[1] 

    set -f project_id "--project_id=mk2-prod"
    # set -f format ""

    if set -q _flag_project_id
        set -f project_id "--project_id=$_flag_project_id"
    end

    if set -q _flag_format
        set -f format "--format=$_flag_format"
    end
    if not set -q _flag_max_rows
        set _flag_max_rows 100000
    end

    if [ $sub_command = "list" ]

        if set -q _flag_columns # -c --columns
            set command "bq show --schema $project_id $_flag_dataset.$_flag_table"
            if set -q _flag_format # -f --format
                set val "$(bq show --schema $format $project_id $_flag_dataset.$_flag_table)"
            else #   no format
                set -l dir "/home/viktor/.config/fish/commands/bigquery/descriptions/columns/$_flag_dataset"
                set -l filename "$dir/$_flag_table"
                if test -e $filename ; and not set -q _flag_overwrite
                    set -f val (cat $filename | string collect)
                else
                    set val "$(bq show --schema $project_id $_flag_dataset.$_flag_table | jq -r '.[] | .name + ": [" + .type + ", " + .mode + "] - (" + .description + ")"')"
                    mkdir -p $dir
                    echo $val > "$filename"
                end
                set val (echo "$val" |  sed -e 's/-/:/g' | sed -e 's/\[//g' | sed -e 's/]//g' | sed -e 's/,/:/g'| string collect )
                set header $(echo "name: type: mode: (description)" | string collect)
                set val (  string join \n "$header" "$val" | string collect )
                set val ( echo "$val"  | column -t -s ":"| string collect)

            end
        else if set -q _flag_table_names_only # --table-names-only
            set -l dir "~/.config/fish/commands/bigquery/descriptions/tables"
            set -l filename "$dir/$_flag_dataset"
            if test -e $filename ; and not set -q _flag_overwrite
                set -f val (cat $filename | string collect)
            else
                set val "$(bq ls --format=prettyjson $project_id $_flag_dataset | jq -r '.[].tableReference.tableId' ) "
                mkdir -p $dir
                echo $val > "$filename"
            end
        else
            if not set -q _flag_format
                set -f format "--format=pretty"
            end
            set val "$(bq ls $format $project_id $_flag_dataset)"
        end

        echo "$val"
    else if [ $sub_command = "query" ]
        set -f query_name $argv[2]
        set -f --path query_path "/home/viktor/hm/research/queries/$query_name.sql"
        set val (cat $query_path | string collect)

        # -------------------------------------------------------------------------------------------------
        # REPLACE VALUES IN QUERY
        if set -q _flag_dataset
            set val  ( echo "$val" | sed -e "s/sbRDOuWobz16XG953Vms/$_flag_dataset/g" | string collect)
            set val  ( echo "$val" | sed -e "s/DATASET_ID_VALUE/$_flag_dataset/g" | string collect)
        end

        if set -q _flag_table
            set val  ( echo "$val" | sed -e "s/TABLE_ID_VALUE/$_flag_table/g" | string collect)
        end
        # DONE: REPLACE VALUES IN QUERY
        # -------------------------------------------------------------------------------------------------

        if set -q _flag_trip_ids
            
            set trips ( tail -n +2 "$_flag_trip_ids" | string collect)

            set output_dir "output" 
            mkdir -p $output_dir

            for id in (string split \n -- $trips)
                set filename "$output_dir/$id.csv"
                set val_temp  ( echo "$val" | sed -e "s/TRIP_ID_VALUE/$id/g" | string collect)
                # echo "$val" > $filename
                echo "$(echo "$val_temp" | bq query --use_legacy_sql=false $project_id --max_rows=$_flag_max_rows --allow_large_results=true --format=csv)" >  $filename
                echo "Data saved to $filename"
                echo "Number of rows in output file: $(sed -n '$=' $filename)"
                echo "The maximum number of rows is: $_flag_max_rows"
                echo
            end
            return
        end

        if set -q _flag_filename
            echo "$(echo "$val" | bq query --use_legacy_sql=false $project_id --max_rows=$_flag_max_rows --allow_large_results=true --format=csv)" > "$_flag_filename" 
            echo "Number of rows in output file: $(sed -n '$=' $_flag_filename)"
            echo "The maximum number of rows is: $_flag_max_rows"
        else
            echo "$(echo "$val" | bq query --use_legacy_sql=false $format $project_id --max_rows=8000 --allow_large_results=true)"
        end
    else if [ $sub_command = "edit" ]
        set -f query_name $argv[2]
        set -f --path query_path "/home/viktor/hm/research/queries/$query_name.sql"
        nvim $query_path
    end

end




