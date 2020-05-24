# Based on: https://github.com/driesvints/dotfiles/blob/master/.zshrc

# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Enable completions
autoload -Uz compinit && compinit

# All files inside $DOTFILES that end in .zsh will be executed in order
ZSH_CUSTOM=$DOTFILES

# Theme settings
ZSH_THEME=""

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  shrink-path
)
source $ZSH/oh-my-zsh.sh

# source ~/.dotfiles/exports
# source ~/.dotfiles/aliases
# source ~/.dotfiles/functions

# iTerm2 integration (setup via: curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh)
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

