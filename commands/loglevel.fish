
complete -x -c loglevel \
    -n '__fish__command_has_no_argument' \
    -a "Off
        Error \
        Warn \
        Info \
        Debug \
        Trace"


function __loglevel_help
    echo "Command: loglevel"
    echo "NAME"
    echo "    loglevel - Command to set the environmental variable RUST_LOG"
    echo ""
    echo "Options"
    echo ""
    echo "    Off"
    echo "          Remove all logs"
    echo ""
    echo "    Error"
    echo "          Designates very serious errors"
    echo ""
    echo "    Warn"
    echo "          Designates hazardous situations"
    echo ""
    echo "    Info"
    echo "          Designates useful information"
    echo ""
    echo "    Debug"
    echo "          Designates lower priority information"
    echo ""
    echo "    Trace"
    echo "          Designates very low priority, often extremely verbose, information"
end


function loglevel 
    # If argument is missing
    if not set -q argv[1]
        __loglevel_help
        return
    end

    set -f loglevel $argv[1] 

    echo "RUST_LOG set as '$loglevel'"
    export RUST_LOG="route_guidance=$loglevel,http_server=$loglevel"
end
