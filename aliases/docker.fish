
alias doc-con-ls="docker container ls"
alias doc-im-ls="docker images --filter=reference='$1*'"
alias doc-im-rm="docker rmi $1"
alias doc-con-rm="docker container rm $1"
alias doc-enter-tag="docker run -it $1 /bin/bash"


alias enter_com="docker run  -it route-guidance-compiled:latest /bin/bash"
alias build_ben="docker build  -t route-guidance-benchmark:latest -f .dockerfiles/benchmark2.dockerfile  ."
alias build_com="docker build  -t route-guidance-compiled:latest -f .dockerfiles/compile.dockerfile  ."


function docker-run --wraps "docker run"
    docker run \
        -e GOOGLE_APPLICATION_CREDENTIALS=/home/viktorhg/hm/.local/mk2-test-firebase-adminsdk-cmdl5-12596b4fd3.json \
        -v $GOOGLE_APPLICATION_CREDENTIALS:/home/viktorhg/hm/.local/mk2-test-firebase-adminsdk-cmdl5-12596b4fd3.json:ro \
        $argv
end
