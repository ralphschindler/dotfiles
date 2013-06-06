#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
# git pull origin master
function doIt() {
    TOP="$(pwd)"
    FILES=$TOP/dot/*
    for f in $FILES
    do
        filename=$(basename "$f")
        dotfilename="~/.$filename"
        echo "Linking $f ... as $dotfilename ... "
        # link here
    done
    
    # copy bin here
    BIN_DIR=$TOP/.bin
    mkdir -p $BIN_DIR
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
