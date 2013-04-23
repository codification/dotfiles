#!/bin/bash

if [ -z $1 ]
then
    arg="link"
else
    arg=$1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

while read subdir;
do
    SOURCE="$DIR/$subdir"
    TARGET="$HOME/$subdir"
    
    if [ $arg == "link" ]
    then
        echo "Linking subdir: $SOURCE to $TARGET"
        if [ -e $TARGET ]
        then
            echo "  >> Skipping $TARGET as it already exists"
        else
            ln -s $SOURCE $TARGET
        fi
    elif [ $arg == "purge" ]
    then
        echo "Unlinking dotfile link: $TARGET"
        unlink $TARGET
    fi
    

done <$DIR/links.txt

