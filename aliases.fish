
#--------------------------------------------------------------------------------------------------------------
# NVIM
#--------------------------------------------------------------------------------------------------------------
# alias nvim='~/.local/bin/nvim.appimage'
alias pnvim='~/.local/bin/pipenv run /home/viktor/.local/bin/nvim.appimage'
alias n='nvim'

alias ssh-init='eval $(ssh-agent -c) && ssh-add ~/.ssh/id_rsa'
alias so-fish='source ~/.config/fish/config.fish'
alias pg_format='/usr/local/lib/node_modules/pg-formatter/dist/pg-formatter/pg_format'

#--------------------------------------------------------------------------------------------------------------
# CPP - BUILD and TESTING
#--------------------------------------------------------------------------------------------------------------

alias ct='ctest --test-dir build --output-on-failure'
alias ctest-all='ctest --test-dir build'

function git-is-merged
    echo "last commit: $(git log --format=%H -n 1 $argv)"
    # echo "- $argv -"
    echo "merge-base:  $(git merge-base $argv wbv)"
end

function remb
    set value $(basename $(pwd))
    if test "$value" = "build"
        cd ..
        rm -rd build;
        mkdir -p build
        cd build
    end
end


function cr
    mkdir -p build
    cd build

    mkdir -p graphviz
    # cmake --graphviz=graphviz/wbv.dot -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_COMPILER=g++-9 -DCMAKE_C_COMPILER=gcc-9 ..

    cmake --graphviz=graphviz/wbv.dot -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=DEBUG ..
    # cmake --graphviz=graphviz/wbv.dot -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=DEBUG -DCMAKE_C_COMPILER=/home/viktor/install/gcc-12/bin/gcc -DCMAKE_CXX_COMPILER=/home/viktor/install/gcc-12/bin/g++ ..

    # cmake --build . 
    make -j12 

    cd graphviz
    dot -Tpng -o wbv.png wbv.dot

    cd ../..
end

function cl
    mkdir -p build2
    cd build2

    mkdir -p graphviz
    cmake --graphviz=graphviz/wbv.dot -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=DEBUG -DCMAKE_CXX_COMPILER=g++-9 -DCMAKE_C_COMPILER=gcc-9 -DVCPKG_PACKAGES_DIR=/home/viktor/repos/vcpkg/packages/matplotplusplus_x64-linux/ ..

    make -j12 

    cd ..
end

function crl-12
    mkdir -p build && cd build
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_COMPILER=/home/viktor/.linuxbrew/bin/g++-12 -DCMAKE_C_COMPILER=/home/viktor/.linuxbrew/bin/gcc-12  -DVCPKG_PACKAGES_DIR=/home/viktor/repos/vcpkg/packages/matplotplusplus_x64-linux/ -DCMAKE_TOOLCHAIN_FILE=/home/viktor/repos/vcpkg/scripts/buildsystems/vcpkg.cmake ..
    make -j12 
    cd ..
end
function crl-11
    mkdir -p build && cd build
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_COMPILER=/usr/bin/g++-11 -DCMAKE_C_COMPILER=/usr/bin/gcc-11 -DVCPKG_PACKAGES_DIR=/home/viktor/repos/vcpkg/packages/matplotplusplus_x64-linux/ -DCMAKE_TOOLCHAIN_FILE=/home/viktor/repos/vcpkg/scripts/buildsystems/vcpkg.cmake ..
    make -j12 
    cd ..
end

function cr-12
    mkdir -p build && cd build
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_COMPILER=/home/viktor/.linuxbrew/bin/g++-12 -DCMAKE_C_COMPILER=/home/viktor/.linuxbrew/bin/gcc-12 ..
    make -j12 
    cd ..
end

function cr-11
    mkdir -p build && cd build
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_COMPILER=/usr/bin/g++-11 -DCMAKE_C_COMPILER=/usr/bin/gcc-11 ..
    make -j12 
    cd ..
end




#--------------------------------------------------------------------------------------------------------------
# AS-TREE
#--------------------------------------------------------------------------------------------------------------

alias tree='fdfind | as-tree'
alias cpp-tree='fdfind -e cpp -e hpp | as-tree'
alias build-tree='fdfind -e so -e lib -e a -e exe --no-ignore | as-tree'
alias bd-tree='fdfind -e so -e a -e exe --no-ignore | as-tree'
alias tree1='fdfind -e $1 | as-tree'
alias tree2='fdfind -e $1 -e $2 | as-tree'

function dtree
    fdfind -t d | as-tree
    # if [ "$1" == "" ]; then
    #     fdfind -t d | as-tree
    # else
    #     fdfind -t d -d $1| as-tree
    # fi
end

#--------------------------------------------------------------------------------------------------------------
# DOCKER
#--------------------------------------------------------------------------------------------------------------

# function doc-build-ft
# {
#     sudo docker build --force-rm -f $1 -t $2 .
# }

#--------------------------------------------------------------------------------------------------------------
# git
#--------------------------------------------------------------------------------------------------------------
function git-c-n
    git log --reverse --pretty=%H wbv2 | grep -A 1 $(git rev-parse HEAD) | tail -n1 | xargs git checkout -q
    git log -1
end
function git-c-p
    git checkout -q HEAD^1
    git log -1
end

#--------------------------------------------------------------------------------------------------------------
# OTHER
#--------------------------------------------------------------------------------------------------------------

alias ports_info='sudo netstat -tunlp'
alias source-aliases='source ~/.config/fish/aliases.fish && echo "Sourced ~/.config/fish/aliases.fish"'
alias source-config='source ~/.config/fish/config.fish && echo "Sourced ~/.config/fish/config.fish"'

alias test-mqtt='mosquitto_sub -p 1884 -t "test-channel"'

alias act='sudo ~/.linuxbrew/bin/act'


alias doc-con-ls="sudo docker container ls"
alias doc-im-ls="sudo docker images --filter=reference='$1*'"
alias doc-im-rm="sudo docker rmi $1"
alias doc-con-rm="sudo docker container rm $1"

alias doc-enter-tag="sudo docker run -it $1 /bin/bash"

alias ssh-set="eval \$(ssh-agent -c) && ssh-add ~/.ssh/work_pc_github"


