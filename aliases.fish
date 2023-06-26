# Exa
alias ei='exa --icons -1 --git -l --no-permissions --no-user --header --sort type' 
alias eo='exa --icons -1 --git -l --no-filesize --no-permissions --no-user --no-time --header --sort type' 
alias ea='exa --icons -1 --git -l --no-filesize --no-permissions --no-user --no-time --header --sort type --all' 
alias eb='exa --icons --git --sort type --all' 
alias et='exa --icons -1 --git -l --no-filesize --no-permissions --no-user --no-time --tree --ignore-glob "build|venv|*cache*"' 
alias es='exa -l --colour-scale --sort size   --no-permissions --no-user --header --group-directories-first --no-time  --icons'

#--------------------------------------------------------------------------------------------------------------
# Random
#--------------------------------------------------------------------------------------------------------------
function ls-ext 
    find . -type f | awk  -e '$1 ~ /\.\w*$/ {print }' | awk -F'.' '{print $NF}' | sort| uniq -c | sort -g
end
alias fd='fdfind'
alias zellij='/home/viktor/install/zellij'
alias pg_format='/usr/local/lib/node_modules/pg-formatter/dist/pg-formatter/pg_format'
alias ssh-init='eval $(ssh-agent -c) && ssh-add ~/.ssh/id_rsa'
alias so-fish='source ~/.config/fish/config.fish'
alias pnvim='home/viktor/.local/bin/pipenv run /home/viktor/.local/bin/nvim.appimage'
alias n='nvim'
alias vcpkg='~/repos/vcpkg/vcpkg'

alias list-vessels='source "/home/viktor/.local/share/virtualenvs/functions-qmhoTpyU/bin/activate.fish"; python3 /home/viktor/hm/HefringCLI/list_vessels/main.py'


function jupyter_pair
    python3 -m jupyter_ascending.scripts.make_pair --base "$argv"
end
function jupyter_sync
    python3 -m jupyter_ascending.requests.sync --filename "$argv.sync.py"
end

function list-features
    for i in $(string split \r\n $(cargo whatfeatures -c never .))
        if string match -q "*  └─*" "$i"; or string match -q "*├─*" "$i"; and not string match -q "*no default features*" "$i"
            echo $i | string replace "└─" "" | string replace "  ├─" "" |  string replace -a " " ""
        end
    end
end

#--------------------------------------------------------------------------------------------------------------
# CPP - BUILD and TESTING
#--------------------------------------------------------------------------------------------------------------
alias ct='ctest --test-dir build --output-on-failure'
alias ctest-all='ctest --test-dir build'
alias projectionist='cp ~/.config/.projections.json .'
alias cb='cmake -B build -S .  -DCMAKE_TOOLCHAIN_FILE=/home/viktor/repos/vcpkg/scripts/buildsystems/vcpkg.cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON'
alias m='make -C build'


function git-is-merged
    echo "last commit: $(git log --format=%H -n 1 $argv)"
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
    cmake --graphviz=graphviz/wbv.dot -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=DEBUG ..
    make -j12 
    cd graphviz
    dot -Tpng -o wbv.png wbv.dot

    cd ../..
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
end

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



alias doc-con-ls="sudo docker container ls"
alias doc-im-ls="sudo docker images --filter=reference='$1*'"
alias doc-im-rm="sudo docker rmi $1"
alias doc-con-rm="sudo docker container rm $1"

alias doc-enter-tag="sudo docker run -it $1 /bin/bash"

alias ssh-set="eval \$(ssh-agent -c) && ssh-add ~/.ssh/work_pc_github"

# function git-set-account-to-viktorhelgi
#     
# end


