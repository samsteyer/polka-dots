#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
BUNDLES_DIR=$SCRIPTPATH/.vim/bundle
REPOS_FILE=$BUNDLES_DIR/plugin_repos.txt

rm -f $REPOS_FILE

for dir in `find $BUNDLES_DIR -maxdepth 1 -type d`; do
	remote_url=`git config -f $dir/.git/config --get remote.origin.url`
	if [[ ! -z "${remote_url// }" ]]; then
		echo $remote_url >> $REPOS_FILE
	fi
done
