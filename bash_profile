[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[ -f /usr/local/etc/bash_completion.d ] && . /usr/local/etc/bash_completion.d

source ~/.nvm/nvm.sh # So nvm will be loaded and work

# Make it so OSX knows about our global gitignore file
git config --global core.excludesfile ~/.gitignore

source ~/dotfiles/git-completion.bash
__git_complete gch _git_checkout
__git_complete ga _git_add
__git_complete gpu _git_push

# Setting PS1
export PS1="\W @ \h [\u] $ "

# Colorscheme stuff
# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

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
alias gcof='git commit --amend --no-edit && git push --force'
alias gpl='git pull '
alias gpu='git push '
alias gm='git merge '
alias gd='git diff '

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

# Tells FZF to use ag, only printing filenames, including hidden ones, and
# respecting .gitignore
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

alias clr='clear'

# Vi mode in bash
set -o vi
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"

