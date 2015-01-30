

alias list_stash  = "git stash list"
alias apply_stash  = "git stash apply"
alias drop_stash = "git stash drop"

export DO_STASH="git stash save" # Aname
export APPLY_STAsH="git stash apply" #idStash/regular expresion
export DIFF_STASH="git stash show -p" #idSTash
#add to git
#git config --global alias.stash-unapply '!git stash show -p | git apply -R'
export APPLY_DIFF="git apply -R"

#do a branch from a stash
#git stash branch namebranch

