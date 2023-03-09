


function __gcloud_list_functions
    argparse 'P/project=' -- $argv

    set -f project "mk2-prod"
    if set -q _flag_project_id
        set -f project "$_flag_project_id"
    end

    set funcs (gcloud functions list --project=$project --format=json | jq -r '.[].name' | string collect) 

    set outputfile "/home/viktor/.config/fish/commands/gcloud/$project/functions"
    echo $funcs > $outputfile
    echo $funcs
end

function __gcloud_functions_update_time_update
    argparse 'P/project=' -- $argv

    set -f project "mk2-prod"
    if set -q _flag_project
        set -f project "$_flag_project"
    end

    set funcs (gcloud functions list --project=$project --format=json | jq -r '.[].name' | string collect) 

    set outputfile "/home/viktor/.config/fish/commands/gcloud/$project/update_time"
    rm  $outputfile
    touch $outputfile

    for func in (string split \n -- $funcs)
        set line "$func"
        set update_time (gcloud functions describe $func --format=json | jq -r '.updateTime')
        for ss in (string split "T" -- $update_time)
            set line (string join "," $line $ss)
        end
        echo $line >> $outputfile
    end
    cat $outputfile
end

function __gcloud_functions_update_time
    argparse 'P/project=' -- $argv

    set -f project "mk2-prod"
    if set -q _flag_project
        set -f project "$_flag_project"
    end
    set outputfile "/home/viktor/.config/fish/commands/gcloud/$project/update_time"

    cat $outputfile
    
end
