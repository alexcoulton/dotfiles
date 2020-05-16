#!/bin/bash

cp ~/.vimrc ~/dotfiles/
cp ~/.tmux.conf ~/vimrc
cp ~/.vimnotes ~/dotfiles/
cd ~/vimrc
git add -A ~/dotfiles/.vimrc
git add -A ~/dotfiles/.vimnotes
git add -A ~/dotfiles/.tmux.conf
git commit -m 'updated vimrc / tmux conf'
git push origin master

