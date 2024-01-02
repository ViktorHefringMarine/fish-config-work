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

source ~/.config/fish/export.fish
source ~/.config/fish/aliases.fish
source ~/.config/fish/prompt.fish
source ~/.config/fish/bindings.fish
source ~/.config/fish/abbrevation.fish
source ~/.config/fish/functions/fish_prompt.fish

source ~/.config/fish/commands/bigquery.fish
source ~/.config/fish/commands/gcloud.fish
source ~/.config/fish/commands/hm.fish
source ~/.config/fish/commands/loglevel.fish
source ~/.config/fish/commands/projectionist.fish
source ~/.config/fish/commands/cm.fish


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/viktorhg/install/google-cloud-sdk/path.fish.inc' ]
    source '/home/viktorhg/install/google-cloud-sdk/path.fish.inc'
end
