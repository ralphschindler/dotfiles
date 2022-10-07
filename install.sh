#!/bin/sh

echo "Setting up your Mac..."

# download latest ZSH iterm2 bindings
curl -L https://iterm2.com/shell_integration/zsh -o $HOME/.iterm2_shell_integration.zsh

# Terminal be quiet
touch $HOME/.hushlogin

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc

# Other .dotfile configs
ln -s $HOME/.dotfiles/gitattributes $HOME/.gitattributes
ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/gitignore $HOME/.gitignore
ln -s $HOME/.dotfiles/screenrs $HOME/.screenrc
ln -s $HOME/.dotfiles/wgetrc $HOME/.wgetrc

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/ralphschindler/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ralphschindler/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle
