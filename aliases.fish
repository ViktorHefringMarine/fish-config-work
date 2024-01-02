

source ~/.config/fish/aliases/exa.fish
source ~/.config/fish/aliases/cpp.fish
source ~/.config/fish/aliases/tree.fish
source ~/.config/fish/aliases/git.fish
source ~/.config/fish/aliases/docker.fish
source ~/.config/fish/aliases/rust.fish

# nvim
alias n='nvim'

# setxkbmap
alias keyboard-setup="setxkbmap A-real-prog-dvorak -option altwin:swap_lalt_lwin"

# scp
alias scp_copy_from="scp -r viktor@10.20.10.200:$1 $2"

# format
alias pg_format='/usr/local/lib/node_modules/pg-formatter/dist/pg-formatter/pg_format'

# ports
alias ports_info='netstat -tunlp'

# mosquitto_sub
alias test-mqtt='mosquitto_sub -p 1884 -t "test-channel"'

alias vcpkg="/home/viktorhg/git-repos/vcpkg/vcpkg"

function __gpush_dfi_help
    echo "HELLO the command needs two arguments. first is the name of the program. second is the dockerfile"
end

function gpush_dfi
    if not set -q argv[2]
        __gpush_dfi_help
        return
    end
    echo $argv[1]
    echo $argv[2]

    # ls build/$argv[1]

	docker buildx build --platform linux/x86_64 -t eu.gcr.io/mk2-test/dfi_$argv[1] --output type=docker -f $argv[2] . 
    docker push eu.gcr.io/mk2-test/dfi_$argv[1]
end
