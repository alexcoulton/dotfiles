#!/bin/bash

NAME=$1

mkdir $NAME
mkdir $NAME/doc
touch $NAME/doc/$NAME.doc
mkdir $NAME/plugin
touch $NAME/plugin/$NAME.vim
