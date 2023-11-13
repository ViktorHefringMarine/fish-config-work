# complete -x -c hm -n '__fish__sub_command_is run-locally' -n '__fish__sub_command_completions' -a "(__list_files)"
# complete -x -c hm -n '__fish__sub_command_is create-proxy' -n '__fish__sub_command_completions' -a "(__list_files)"
# complete -x -c hm -n '__fish__sub_command_is build' -n '__fish__sub_command_completions'
# complete -x -c hm -n '__fish__sub_command_is deploy' -n '__fish__sub_command_completions'
# complete -x -c hm -n '__fish__sub_command_is help' -n '__fish__sub_command_completions'
complete -x -c hm \
    -n '__fish__command_has_no_argument' \
    -a "run-locally \
        create-proxy \
        build \
        deploy \
        list \
        activate-prod-env \
        activate-test-env \
        help" 

function __hm_help
    echo "Command: hm"
    echo "NAME"
    echo "    hm - Hefring Marine commands"
    echo ""
    echo "SUB-COMMANDS"
    echo ""
    echo "    run-locally"
    echo "          Run the cargo function locally"
    echo ""
    echo "    create-proxy"
    echo "          Create a proxy for the service to be able to call the gcloud run api locally"
    echo ""
    echo "    build"
    echo "          Build the container to gcloud artifact-registry"
    echo ""
    echo "    activate-prod-env"
    echo "          change the environment to the mk2-prod environment"
    echo ""
    echo "    activate-test-env"
    echo "          change the environment to the mk2-test environment"
    echo ""
    echo "    deploy"
    echo "          Deploy the gcloud container with gcloud run"
    echo ""
    echo "    list"
    echo "          List all images in the route-guidance/api artifact repo"
end

function hm
    # argparse 'd/dataset='\
    #     'P/project_id=' \
    #     'f/format=' \
    #     'c/columns' \
    #     'n/table-names-only' \
    #     't/table=' \
    #     'o/overwrite' \
    #     'F/filename=' \
    #     'M/max_rows=' \
    #     'T/trip_ids=' \
    #     -- $argv

    # If argument is missing
    if not set -q argv[1]
        __hm_help
        return
    end
    
    set -f sub_command $argv[1] 


    if test $sub_command = "run-locally"; 
        or test $sub_command = "deploy";
        or test $sub_command = "build"

        cd "/home/viktorhg/hm/route-guidance"
    end

    if test $sub_command = "run-locally"
        cargo run --release --features dev --bin http-server

    else if test $sub_command = "create-proxy"
        gcloud run services proxy route-guidance \
            --region="europe-west1" \
            --project mk2-test

    else if test $sub_command = "build"
        echo "Running "
        echo "gcloud builds submit "
        echo "    --region=\"europe-west1\""
        echo "    --config=\".cloudbuild_http_server.yaml\""
        echo "    --machine-type=\"E2_HIGHCPU_32\""

        gcloud builds submit \
            --region="europe-west1" \
            --config=".cloudbuild_http_server.yaml" \
            --machine-type="E2_HIGHCPU_32"

    else if test $sub_command = "deploy"

        if set -q argv[2]
            set -f api_version $argv[2] 

            echo "Running "
            echo "gcloud run deploy"
            echo "    route-guidance "
            echo "    --region=\"europe-west1\""
            echo "    --image=\"europe-west1-docker.pkg.dev/mk2-test/route-guidance/api:$api_version\""
            echo "    --command=\"http-server\""
            echo "    --allow-unauthenticated"
            echo "    --memory=32G"
            echo "    --cpu=8"
            echo "    --timeout=45m"
            echo "    --max-instances=2"

            gcloud run deploy route-guidance \
                --region="europe-west1" \
                --image="europe-west1-docker.pkg.dev/mk2-test/route-guidance/api:$api_version" \
                --command="http-server" \
                --allow-unauthenticated \
                --memory=32G \
                --cpu=8 \
                --timeout=45m \
                --max-instances=2


        else 

            echo "Running "
            echo "gcloud run deploy"
            echo "    route-guidance "
            echo "    --region=\"europe-west1\""
            echo "    --image=\"europe-west1-docker.pkg.dev/mk2-test/route-guidance/api:latest\""
            echo "    --command=\"http-server\""
            echo "    --allow-unauthenticated"
            echo "    --memory=32G"
            echo "    --cpu=8"
            echo "    --timeout=45m"
            echo "    --max-instances=2"

            gcloud run deploy route-guidance \
                --region="europe-west1" \
                --image="europe-west1-docker.pkg.dev/mk2-test/route-guidance/api:latest" \
                --command="http-server" \
                --allow-unauthenticated \
                --memory=32G \
                --cpu=8 \
                --timeout=45m \
                --max-instances=2

        end

    else if test $sub_command = "list"
        gcloud artifacts docker tags list \
            europe-west1-docker.pkg.dev/mk2-test/route-guidance/api

    else if test $sub_command = "activate-prod-env"
        # export GOOGLE_APPLICATION_CREDENTIALS="/home/viktorhg/hm/.local/mk2-prod-firebase-adminsdk-zzeux-8db3867c4c.json"
        export PROJECT_ID="mk2-prod"
        gcloud config set project mk2-prod
    else if test $sub_command = "activate-test-env"
        # export GOOGLE_APPLICATION_CREDENTIALS="/home/viktorhg/hm/.local/mk2-test-firebase-adminsdk-cmdl5-12596b4fd3.json"
        export PROJECT_ID="mk2-test"
        gcloud config set project mk2-test
    else if test $sub_command = "help"
        __hm_help

    else
        echo "ERROR: (hm) Invalid choice: '$sc'"
        echo "Usage: run 'hm help'"
    end
end


# Run Locally
# - cargo run --release --features dev --bin http-server

# Create Proxy
# - gcloud run services proxy route-guidance --project mk2-test

# Build
# - gcloud builds submit --region=europe-west1 --config=".cloudbuild_http_server.yaml" --machine-type=E2_HIGHCPU_32

# Deploy 
# - gcloud run deploy route-guidance --image="europe-west1-docker.pkg.dev/mk2-test/route-guidance/api:latest" --command="http-server" --memory=32G --cpu=8 --timeout=20m --max-instances=2

