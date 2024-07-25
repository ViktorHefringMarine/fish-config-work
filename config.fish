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

for x in (string split " " -- $(fd --full-path . ~/.config/fish/commands -e fish))
    source $x
end

# eval $(ssh-agent -c) 
# ssh-add ~/.ssh/github-viktorhefringmarine


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/viktorhg/install/google-cloud-sdk/path.fish.inc' ]
    source '/home/viktorhg/install/google-cloud-sdk/path.fish.inc'
end



# Okey, thetta lib a ad vera generic. Er thad ekki. Thad er ad segja

# Ef thetta library a ad vera generic, thannig ad thad se notad a morgum stodum. Tha a thad ekki ad innihalda
# foll sem virka bara fyrir eitthvad eitt tilfelli. 
#
# Thegar baett eru vid foll i library a ad hafa thad i huga ad 
#
# get_unique_timestamps. Hvad thydir thad thad tekur in company_id, vessel_id og trip_id.
# thad tekur inn 
