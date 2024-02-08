#!/bin/bash

TMPDIR=$(mktemp -d /tmp/configs_XXXXXX)

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/TheBunnyMan123/dotfiles.git $TMPDIR
ls $TMPDIR
cp -r -v $TMPDIR/ $HOME/
