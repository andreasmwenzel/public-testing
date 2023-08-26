#!/usr/bin/env sh
cd $GITHUB_WORKSPACE
cd ..

echo "Cloning git-secrets code from github"
echo "PWD $(pwd)"
git clone https://github.com/awslabs/git-secrets.git

cd $GITHUB_WORKSPACE
echo "PWD $(pwd)"

echo "installing git secrets into repo"
../git-secrets/git-secrets --install

echo "Adding pattern to catch"
../git-secrets/git-secrets --add-provider -- cat ./secret-setup/secret-regex
