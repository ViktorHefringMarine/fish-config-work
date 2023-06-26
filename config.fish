# source /home/viktor/repos/vcpkg/scripts/vcpkg_completion.bash
# source /home/viktor/.completions/bash_gh.sh
# source ~/.tmux/plugins/tat/tat.sh
# source ~/.config/fish/completions/tmuxinator.fish

# if not set -q TMUX
#     set -g TMUX tmux new-session -d -s base
#     eval $TMUX
#     # tmux attach-session -d -t base
#     tmux a
# end




# export EDITOR="/home/viktorhg/.local/bin/nvim.appimage"
export EDITOR="/usr/bin/vim"
export SHELL="/usr/bin/fish"
export CPLUS_INCLUDE_PATH="/usr/include/gdal"
export C_INCLUDE_PATH="/usr/include/gdal"

# export PIPENV_IGNORE_VIRTUALENVS=1
# export C_INCLUDE_PATH=""

# export GOPATH="/home/viktor/install/go"

# set -U fish_user_paths /usr/local/bin/openssl $fish_user_paths
# set -U fish_user_paths /home/viktor/repos/openssl/include $fish_user_paths
# set -U fish_user_paths /home/viktor/repos/openssl/include/crypto $fish_user_paths
# set -U fish_user_paths /home/viktor/repos/openssl/include/internal $fish_user_paths
# set -U fish_user_paths /home/viktor/repos/openssl/include/openssl $fish_user_paths
set -U fish_user_paths /home/viktor/.cargo/bin $fish_user_paths
set -U fish_user_paths /home/viktor/.local/bin $fish_user_paths
set -U fish_user_paths /home/viktor/go/bin $fish_user_paths
set -U fish_user_paths /home/viktor/.bin $fish_user_paths
# set -U fish_user_paths /usr/local/bin $fish_user_paths
# set -U fish_user_paths /usr/local/include $fish_user_paths
# set -U fish_user_paths /usr/local/include $fish_user_paths
# set -U fish_user_paths /usr/lib/ssl $fish_user_paths

# export PATH="/home/viktor/.cargo/bin:$PATH"
# export PATH="/home/viktor/.local/bin:$PATH"
# export PATH="/home/viktor/install/go/bin:$PATH"

source ~/.config/fish/aliases.fish
source ~/.config/fish/prompt.fish
source ~/.config/fish/bindings.fish
source ~/.config/fish/abbrevation.fish
source ~/.config/fish/functions/fish_prompt.fish

source ~/.config/fish/commands/bigquery.fish
source ~/.config/fish/commands/gcloud.fish

set -U fish_user_paths /usr/local/bin $fish_user_paths
set -U fish_user_paths /usr/local/include $fish_user_paths


# starship init fish | source
