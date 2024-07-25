
function __list_image_names
    docker ps | tr -s ' ' |  cut -d' ' -f2 | tail -n +2
end


complete -x -c docker-exec-into-container -a "(__list_image_names)"

# complete -x -c den -s c -l command -d "The entrypoint into the docker-container" -a "/bin/bash "

function docker-exec-into-container
    set -f sub_command $argv[1] 

    if not set -q argv[1]
        echo "Usage: den <docker-container>"
        return 1
    end

    set container_id $(docker ps | grep "$sub_command" | tr -s ' ' |  cut -d' ' -f1)

    docker exec -it $container_id "/bin/bash"
end
