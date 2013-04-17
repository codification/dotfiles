#!/bin/bash


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

while read subdir;
do
    SOURCE="$DIR/$subdir"
    TARGET="$HOME/$subdir"
    echo "Linking subdir: $SOURCE to $TARGET"
    if [ -e $TARGET ]
    then
        echo "  >> Skipping $TARGET as it already exists"
    else
        ln -s $SOURCE $TARGET
    fi

done << EOF
.live-packs
.emacs-live.el
.vim
.vimrc
EOF

