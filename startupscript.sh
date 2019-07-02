# Things to do NOT in this script:
# 1. Bind CAPS LOCK to ESC
# 2. Install Tmux and set up the conf for it!
# 3. Install reattach to user namespace as well
# 4. Install homebrew too
# 6. Install the_silver_searcher (Ag)
# 7. curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash.

# Making the necessary symlinks to .rc files
./~/makesymlinks.sh

# Installing Vundle
echo "Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "...done"

# Installing vim plugins
echo "Installing vim plugins"
vim +PluginInstall +qall
echo "...done. Remember you still need to compile YCM!"

# Performing git configuration
# Setting global .gitignore
echo "Setting global gitignore file"
git config --global core.excludesfile ~/dotfiles/.gitignore_global
echo "...done"
