# ZSH Setup, see https://github.com/robbyrussell/oh-my-zsh/blob/master/templates/zshrc.zsh-template for initial template
export ZSH="/Users/ralphschindler/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

source ~/.dotfiles/exports
source ~/.dotfiles/aliases
source ~/.dotfiles/functions

# iTerm2 integration (setup via: curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh)
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

