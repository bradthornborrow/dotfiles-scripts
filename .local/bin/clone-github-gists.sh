#!/bin/bash
#
# This script clones all Gists for user into the current directory
#
if [ $# -eq 0 ]
  then
    echo "Usage: $0 <user_name> "
    exit;
fi

curl -s https://api.github.com/users/$1/gists | jq '.[] | .files | .[] | .raw_url' | xargs -n 1 curl -O
for f in *.md; do mv -i "$f" "$(echo "$f" | sed 's/%20/ /g')"; done
