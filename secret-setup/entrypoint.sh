#!/usr/bin/env sh

set -e

# echo "Installing bash"
# apk add --no-cache bash

# echo "Installing git & make"
# apk add --no-cache git make

echo "Cloning git-secrets code from github"
git clone https://github.com/awslabs/git-secrets.git

echo "Installing git-secrets"
cd git-secrets && make install && cd $GITHUB_WORKSPACE

echo "Adding pattern to catch"
git secrets --add-provider -- cat /secret-regex

echo "PWD $(pwd)"
echo "ls $(ls -al)"

printenv

for commit in $(git rev-list ${{ github.base_ref }}..${{ github.head_ref }}); do
    git checkout $commit
    echo "Running git-secrets"
    git secrets --scan
done
