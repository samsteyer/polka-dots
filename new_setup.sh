#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

ln -s $SCRIPTPATH/.vimrc $HOME/.vimrc
ln -s $SCRIPTPATH/.vim $HOME/.vim
ln -s $SCRIPTPATH/.portablerc $HOME/.portablerc

exec $SCRIPTPATH/fetch_plugin_repos.sh

echo 'source $HOME/.portablerc' >> $HOME/.bash_profile
