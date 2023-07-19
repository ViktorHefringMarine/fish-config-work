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
export EDITOR="/usr/local/bin/nvim"
export SHELL="/usr/bin/fish"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

source ~/.config/fish/aliases.fish
source ~/.config/fish/prompt.fish
source ~/.config/fish/bindings.fish
source ~/.config/fish/abbrevation.fish
source ~/.config/fish/functions/fish_prompt.fish

source ~/.config/fish/commands/bigquery.fish
source ~/.config/fish/commands/gcloud.fish


# starship init fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/viktorhg/install/google-cloud-sdk/path.fish.inc' ]; . '/home/viktorhg/install/google-cloud-sdk/path.fish.inc'; end
