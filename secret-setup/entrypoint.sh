#!/usr/bin/env sh

set -e

# echo "Installing bash"
# apk add --no-cache bash

# echo "Installing git & make"
# apk add --no-cache git make

cd $GITHUB_WORKSPACE
cd ..

echo "PWD $(pwd)"
echo "ls $(ls -al)"

echo "Cloning git-secrets code from github"
git clone https://github.com/awslabs/git-secrets.git

# echo "Installing git-secrets"
# cd git-secrets && make install && 

cd $GITHUB_WORKSPACE
echo "PWD $(pwd)"
echo "ls $(ls -al)"

echo "Adding pattern to catch"
../git-secrets/git-secrets --add-provider -- cat ./secret-setup/secret-regex

echo "installing into repo"
../git-secrets/git-secrets --install

../git-secrets/git-secrets --scan
# printenv

# for commit in $(git rev-list ${{ github.base_ref }}..${{ github.head_ref }}); do
#     git checkout $commit
#     echo "Running git-secrets"
# done
