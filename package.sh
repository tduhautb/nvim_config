#!/bin/bash

tmp_dir=$(mktemp -d)
cd $tmp_dir

# copy configuration directory
cp -r $HOME/.config/nvim .
# remove git directory
rm -rf nvim/.git

# copy plugins
mkdir plugins
cp -r $HOME/.local/share/nvim/lazy plugins/
for folder in plugins/lazy/*
do
  rm -rf $folder/.git
  rm -rf $folder/.github
done

# create the archive
tar -czvf nvim_config.tar.gz .

echo $tmp_dir
