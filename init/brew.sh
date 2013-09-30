#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install Bash 4
brew install bash

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep


# Install other useful binaries
brew install ack
brew install git
brew install imagemagick
brew install rename
brew install tree
brew install webkit2png
brew install bash-completion

brew install automake
brew install autoconf
brew install curl
brew install pcre
brew install re2c
brew install mhash
brew install libtool
brew install icu4c
brew install gettext
brew install jpeg
brew install exiftool
brew install libxml2
brew install mcrypt
brew install gmp
brew install libevent
brew install mysql
brew install lesspipe
brew install node
brew install npm
brew install gist

brew link icu4c

# Remove outdated versions from the cellar
brew cleanup
