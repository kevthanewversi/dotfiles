#git aliases
alias gs='git status '
alias ga='git add'
alias gad='git add -A'
alias gb='git branch '
alias gc='git commit'
alias gr='git rm'
alias gd='git diff'
alias gk='gitk --all&'
alias gx='gitx --all'
alias gp='git push'
alias grb='git rebase master'
alias gri='git rebase master -i'
alias gpf='git push --force-with-lease'
alias gw='git diff --stat origin/master..'


#vim
alias vi="/usr/bin/vim"
export EDITOR="open -a MacVim"
export VISUAL="open -a MacVim"
alias weather='curl v2.wttr.in'

#random
alias rb=$'git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb'| xargs  bundle exec rubocop -A'
alias rs=$'git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$'| xargs  bundle exec rspec'
