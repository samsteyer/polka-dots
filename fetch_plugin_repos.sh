#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
BUNDLES_DIR=$SCRIPTPATH/.vim/bundle
REPOS_FILE=$BUNDLES_DIR/plugin_repos.txt

pushd $BUNDLES_DIR
while read repo_url; do git clone $repo_url; done < $REPOS_FILE
popd
