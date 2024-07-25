
complete -x -c start-proxy \
    -n '__fish__command_has_no_argument' \
    -a "help \
        cloud-sql-proxy" 



complete -x -c start-proxy -s p -l project_id -d "The Project ID" -a "mk2-test mk2-prod"

function start-proxy
    argparse 'p/project_id=' -- $argv

    if not set -q argv[1]
        echo "Missing sub command"
        return
    end

    set -f sub_command $argv[1] 

    if test $sub_command = "help"
        echo "Help is not implemented yet"

    else if test $sub_command = "cloud-sql-proxy"
        if not set -q _flag_project_id
            # Check if `PROJECT_ID` variable is set
            if not set -q PROJECT_ID
                echo "Missing project ID"
                return
            else 
                set _flag_project_id $PROJECT_ID
            end
        end

        # Ensure that the project ID is valid
        if test $_flag_project_id != "mk2-test" -a $_flag_project_id != "mk2-prod"
            echo "Invalid project ID $_flag_project_id"
            return
        end

        if test $_flag_project_id = "mk2-test"
            gcloud config set project mk2-test
        else if test $_flag_project_id = "mk2-prod"
            gcloud config set project mk2-prod
        end

        echo "Starting cloud-sql-proxy"
        echo " - Project ID: $_flag_project_id"
        echo ""

        if test $_flag_project_id = "mk2-test"
            /home/viktorhg/install/cloud-sql-proxy mk2-test:europe-west1:temporary-test-database
            # /home/viktorhg/install/cloud-sql-proxy --private-ip mk2-test:europe-west1:temporary-test-database
            return
        else if test $_flag_project_id = "mk2-prod"
            echo "There is no prod database yet"
            return
        else
            echo "Invalid project ID $_flag_project_id"
            return
        end
    else
        echo "Invalid subcommand `$sub_command`"
    end
end
