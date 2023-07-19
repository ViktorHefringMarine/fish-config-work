#==============================================================================================================
# Exa
#--------------------------------------------------------------------------------------------------------------

alias e='exa --icons -j'

#==============================================================================================================
# General
#--------------------------------------------------------------------------------------------------------------
function exa-long --wraps exa --description 'exa long'
    exa -l --colour-scale --no-permissions --no-user --header --group-directories-first --no-time  --icons $argv
end

function eas --wraps exa --description 'exa sort-size'
    exa-long --sort size $argv
end

function ead --wraps exa --description 'exa sort-date'
    exa-long --sort date $argv
end

function eat --wraps exa --description 'exa sort-type'
    exa-long --sort type $argv
end

function exa-tree --wraps exa --description 'exa tree'
    exa-git -1 -l --no-filesize --no-permissions --no-user --no-time --tree
end

abbr --add eo   "exa-long"
abbr --add es   "exa-long --sort"
abbr --add ea   "exa-long --all"


#==============================================================================================================
# Git
#--------------------------------------------------------------------------------------------------------------
function exa-git --wraps exa --description 'exa git'
    exa --icons --git --git-ignore $argv
end

function egi --wraps exa --description 'exa-git info'
    exa-git -1 -l --no-permissions --no-user --header --sort type $argv
end

function ego --wraps exa --description 'exa-git one-line'
    exa-git -1 -l --no-filesize --no-permissions --no-user --no-time --header --sort type $argv
end


function ega --wraps exa --description 'exa-git one-line --all'
    exa-git -1 -l --no-filesize --no-permissions --no-user --no-time --header --sort type --all $argv
end

function egt --wraps exa --description 'exa-git tree'
    exa-git -1 -l --no-filesize --no-permissions --no-user --no-time --tree --ignore-glob "build|venv|*cache*" $argv
end

