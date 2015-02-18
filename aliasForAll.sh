

alias list_stash="git stash list"
alias apply_stash="git stash apply"
alias drop_stash="git stash drop"
alias git_log="git log --all --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gg='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias tbreak='tmux break-pane'

export DO_STASH="git stash save" # Aname
export APPLY_STAsH="git stash apply" #idStash/regular expresion
export DIFF_STASH="git stash show -p" #idSTash
#add to git
#git config --global alias.stash-unapply '!git stash show -p | git apply -R'
export APPLY_DIFF="git apply -R"

#add revert change to a file.
#git checkout origin/master -- path/to/file


#do a branch from a stash
#git stash branch namebranch

