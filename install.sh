#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh)
  
  
  
# old: 

# cd "$(dirname "${BASH_SOURCE}")"
# # git pull origin master
# function doIt() {
#     TOP1="$(pwd)"
#   TOP2=$(dirname "$TOP1")
#     FILES=$TOP2/*
#     for f in $FILES
#     do
#     if [[ ! -f $f || "$f" == *README.md* ]]; then
#       continue
#     fi
#         filename=$(basename "$f")
#         dotfilename=$HOME"/.$filename"
#         echo "Linking $f ... as $dotfilename ... "
#         ln -s $f $dotfilename
#     done
#
#     # copy bin here
#     # BIN_DIR=$TOP2/.bin
#     mkdir -p $HOME"/.bin"
# }
# if [ "$1" == "--force" -o "$1" == "-f" ]; then
#   doIt
# else
#   read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
#   echo
#   if [[ $REPLY =~ ^[Yy]$ ]]; then
#     doIt
#   fi
# fi
# unset doIt
# echo "run 'source ~/.bash_profile' in order for any changes to take effect"