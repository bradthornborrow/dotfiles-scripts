#!/bin/bash
#
# This script clones all GitHub repositories for user into the current directory
#
if [ $# -eq 0 ]
  then
    echo "Usage: $0 <user_name> "
    exit;
fi

REPO_LIST=$(curl -s https://api.github.com/users/$1/repos?per_page=1000 |grep clone_url |awk '{print $2}'| sed 's/"\(.*\)",/\1/')

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
