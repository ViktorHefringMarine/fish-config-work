# alias doc-con-ls="docker container ls"
# alias doc-im-ls="docker images --filter=reference='$1*'"
# alias doc-im-rm="docker rmi $1"
# alias doc-con-rm="docker container rm $1"
# alias doc-enter-tag="docker run -it $1 /bin/bash"
#
#
# alias enter_com="docker run  -it route-guidance-compiled:latest /bin/bash"
# alias build_ben="docker build  -t route-guidance-benchmark:latest -f .dockerfiles/benchmark2.dockerfile  ."
# alias build_com="docker build  -t route-guidance-compiled:latest -f .dockerfiles/compile.dockerfile  ."
#
#
# function docker-run --wraps "docker run"
#     docker run \
#         -e GOOGLE_APPLICATION_CREDENTIALS=/home/viktorhg/hm/.local/mk2-test-firebase-adminsdk-cmdl5-12596b4fd3.json \
#         -v $GOOGLE_APPLICATION_CREDENTIALS:/home/viktorhg/hm/.local/mk2-test-firebase-adminsdk-cmdl5-12596b4fd3.json:ro \
#         $argv
# end

# mosquitto_pub -h "10.20.10.204" -t "nmea/pgn/127489" -m "$(cat tmp.json)"


# list the files
# complete mosq 

set FD_COMMAND "fd"

function echo_json_files_in_current_dir

    set out ($FD_COMMAND --full-path . . -e json)
    echo $out
end

function __mosquitto_list_files
    for x in (string split " " -- $(echo_json_files_in_current_dir))
        set filename (string split -r -m1 / $x)[2]
        set rootname (string split . $filename)[1]
        echo "$rootname.json"
    end
end

function __mosquitto__command_has_no_argument
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 ]
    return 0
  end
  return 1
end

function __mosquitto__has_one_argument
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
      return 0
  end
  return 1
end


complete -x -c pubf -n '__fish__command_has_no_argument' -a "\
\"config\" \
\"nmea/pgn/127488\" \
\"nmea/pgn/127489\" \
\"nmea/pgn/127250\""
complete -x -c pubf -n '__mosquitto__has_one_argument' -a "(__mosquitto_list_files)"


function pubf
    echo "mosquitto_pub"
    echo " - topic: $argv[1]"
    echo " - file: $argv[2]"
    mosquitto_pub -h "10.20.10.238" -t $argv[1] -m "$(cat $argv[2])"
end
