#==============================================================================================================
# AS-TREE
#--------------------------------------------------------------------------------------------------------------

alias tree='fd | as-tree'
alias cpp-tree='fd -e cpp -e hpp | as-tree'
alias build-tree='fd -e so -e lib -e a -e exe --no-ignore | as-tree'
alias bd-tree='fd -e so -e a -e exe --no-ignore | as-tree'
alias tree1='fd -e $1 | as-tree'
alias tree2='fd -e $1 -e $2 | as-tree'

function dtree
    fd -t d | as-tree
end
