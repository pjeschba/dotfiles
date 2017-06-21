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
