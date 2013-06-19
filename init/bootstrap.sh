#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
# git pull origin master
function doIt() {
    TOP1="$(pwd)"
	TOP2=$(dirname "$TOP1")
    FILES=$TOP2/*
    for f in $FILES
    do
		if [[ ! -f $f || "$f" == *README.md* ]]; then
			continue
		fi
        filename=$(basename "$f")
        dotfilename=$HOME"/.$filename"
        echo "Linking $f ... as $dotfilename ... "
        ln -s $f $dotfilename
    done
    
    # copy bin here
    # BIN_DIR=$TOP2/.bin
    mkdir -p $HOME"/.bin"
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
echo "run 'source ~/.bash_profile' in order for any changes to take effect"
