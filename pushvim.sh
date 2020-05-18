#!/bin/bash

cp ~/.vimrc ~/dotfiles/
cp ~/.tmux.conf ~/dotfiles
cp ~/.vimnotes ~/dotfiles/
cd ~/dotfiles
#git add -A ~/dotfiles/.vimrc
git add -A ./*
#git add -A ~/dotfiles/.vimnotes
#git add -A ~/dotfiles/.tmux.conf
git commit -m 'updated vimrc / tmux conf'
git push origin master

