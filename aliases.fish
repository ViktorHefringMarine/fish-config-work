

source ~/.config/fish/aliases/exa.fish
source ~/.config/fish/aliases/cpp.fish
source ~/.config/fish/aliases/tree.fish
source ~/.config/fish/aliases/git.fish
source ~/.config/fish/aliases/docker.fish
source ~/.config/fish/aliases/rust.fish
source ~/.config/fish/aliases/mosquitto.fish

# nvim
alias n='nvim'

alias zed="~/git-repos/zed/target/release/zed"

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

function remmina-hefring-server 
    remmina -c "vnc://192.168.68.111?VncPassword=$(pass show remmina/192.168.68.111)"
end

# function __delete-all-nvim-colorschemes
#    # sudo mv /usr/local/share/nvim/runtime/colors/default.vim       ~/.nvim-colorschemes/default.vim        
#    sudo mv /usr/local/share/nvim/runtime/colors/delek.vim         ~/.nvim-colorschemes/delek.vim          
#    sudo mv /usr/local/share/nvim/runtime/colors/desert.vim        ~/.nvim-colorschemes/desert.vim         
#    sudo mv /usr/local/share/nvim/runtime/colors/elflord.vim       ~/.nvim-colorschemes/elflord.vim        
#    sudo mv /usr/local/share/nvim/runtime/colors/evening.vim       ~/.nvim-colorschemes/evening.vim        
#    # sudo mv /usr/local/share/nvim/runtime/colors/habamax.vim       ~/.nvim-colorschemes/habamax.vim        
#    sudo mv /usr/local/share/nvim/runtime/colors/industry.vim      ~/.nvim-colorschemes/industry.vim       
#    sudo mv /usr/local/share/nvim/runtime/colors/koehler.vim       ~/.nvim-colorschemes/koehler.vim        
#    sudo mv /usr/local/share/nvim/runtime/colors/lunaperche.vim    ~/.nvim-colorschemes/lunaperche.vim     
#    sudo mv /usr/local/share/nvim/runtime/colors/morning.vim       ~/.nvim-colorschemes/morning.vim        
#    sudo mv /usr/local/share/nvim/runtime/colors/murphy.vim        ~/.nvim-colorschemes/murphy.vim         
#    sudo mv /usr/local/share/nvim/runtime/colors/pablo.vim         ~/.nvim-colorschemes/pablo.vim          
#    sudo mv /usr/local/share/nvim/runtime/colors/peachpuff.vim     ~/.nvim-colorschemes/peachpuff.vim      
#    sudo mv /usr/local/share/nvim/runtime/colors/quiet.vim         ~/.nvim-colorschemes/quiet.vim          
#    # sudo mv /usr/local/share/nvim/runtime/colors/README.txt        ~/.nvim-colorschemes/README.txt         
#    sudo mv /usr/local/share/nvim/runtime/colors/ron.vim           ~/.nvim-colorschemes/ron.vim            
#    sudo mv /usr/local/share/nvim/runtime/colors/shine.vim         ~/.nvim-colorschemes/shine.vim          
#    sudo mv /usr/local/share/nvim/runtime/colors/slate.vim         ~/.nvim-colorschemes/slate.vim          
#    sudo mv /usr/local/share/nvim/runtime/colors/torte.vim         ~/.nvim-colorschemes/torte.vim          
#    sudo mv /usr/local/share/nvim/runtime/colors/zellner.vim       ~/.nvim-colorschemes/zellner.vim        
# end
