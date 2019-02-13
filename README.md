# Ralph’s dotfiles

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/ralphschindler/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

## Additional Setup

### Common bins

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./init/bin.sh
```

### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./init/osx.sh
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./init/brew.sh
```


# Things not in the repository

* Git settings
* SSH settings









# 2017

- cli tools
- homebrew
- homebrew-php
- brew cask
    - install textmate
    - install adium
    - install alfred
    - intsall iterm2
    - install querious
    - install slack
    - install docker
- resize dock
- unpin docker icons

    - 

## Original Author Inspiration

[Mathias Bynens's](http://mathiasbynens.be/) [dotfiles](https://github.com/mathiasbynens/dotfiles/)
