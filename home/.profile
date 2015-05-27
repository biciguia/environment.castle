PATH=$PATH:~/bin
PATH=$PATH:~/local/bin
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
source ~/bin/.git-prompt.sh
source ~/bin/.git-completion.bash
#export PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "
