[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[ -f /usr/local/etc/bash_completion.d ] && . /usr/local/etc/bash_completion.d

source ~/dotfiles/git-completion.bash
__git_complete gch _git_checkout
__git_complete ga _git_add
__git_complete gpu _git_push

# Setting PS1
export PS1="\W @ \h [\u] $ "

# Colorscheme stuff
# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# Path stuff
export PATH="$HOME/.node_modules_global/bin:$PATH:$HOME/dotfiles"

# Aliases
alias unraid='ssh root@10.1.10.48'
alias UMich='cd ~/Documents/UMich/2017-2018'
alias c++='g++ -Wall -Werror -pedantic -g -std=c++14'

# Git aliases
alias gs='git status'
alias gch='git checkout'
alias ga='git add '
alias gb='git branch '
alias gco='git commit '
alias gcof='git commit --amend --no-edit'
alias gpl='git pull '
alias gpu='git push '
alias gm='git merge '
alias gd='git diff '
function gpuf() {
    CURRENT_BRANCH=$(git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3)
    git push --force origin $CURRENT_BRANCH
}

# Functions

function cmd() {
 SECTION="# "
 SECTION+="$@"
 sed -n "/^$SECTION$/,/^$/p" $HOME/dotfiles/alwaysforget.txt
}

function killp() {
PORT=$1
PROCESSES=$(lsof -t -i :$PORT)
printf "Processes running at port $PORT:\n$(lsof -i :$PORT)\n"
read -p "Kill? (y/n)?" choice
case "$choice" in
  y|Y )
	  echo "Killing processes at $PORT"
	  kill -kill "$PROCESSES"
	  ;;
  n|N ) echo "Exiting";;
  * ) echo "Invalid choice";;
esac
}

# Tells FZF to use ag, only printing filenames without color, including hidden ones
alias ag='ag --path-to-ignore ~/.ignore'
export FZF_DEFAULT_COMMAND='ag -l --nocolor --hidden -g ""'

alias clr='clear'

# Vi mode in bash
set -o vi
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
