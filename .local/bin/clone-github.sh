#!/bin/bash
#
# This script clones all Github repositories for user into the current directory
#
if [ $# -eq 0 ]
  then
    echo "Usage: $0 <user_name> "
    exit;
fi

REPO_LIST=$(curl -s https://api.github.com/users/$1/repos?per_page=1000 | jq -r '.[].ssh_url')

for repo in $REPO_LIST;do

repo_name=${repo%.git}
repo_name=${repo_name#https://github.com/$1/}

if [ -d "$repo_name" ];
  then
    cd $repo_name;
    git pull;
    cd ..
  else
    git clone $repo;
fi

done;