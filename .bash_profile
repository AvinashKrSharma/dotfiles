# Git aliases
alias gb='git branch '
alias ga='git add '
alias gaa='git add -A'
alias gc='git commit -m '
alias gd='git diff '
alias gdc='git diff --cached '
alias gds='git diff --staged'
alias gsh='git show '
alias gps='git push '
alias gpsod='git push origin development'
alias gpsom='git push origin master'
alias gpl='git pull '
alias gm='git merge '
alias gs='git status '
alias gch='git checkout '
alias gcl='git clone '
alias gl='git log --oneline --decorate --graph --color --summary'
alias glp='git log -p '
alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'

parse_git_branch() {
	   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\n\[\e[32;1m\](\[\e[37;1m\]\u\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\])\$(parse_git_branch)\n (\!\[\e[32;1m\])-> \[\e[0m\]"

export SHELL=/bin/zsh
exec /bin/zsh -l