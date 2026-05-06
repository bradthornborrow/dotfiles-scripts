#
# This script clones all Gitlab repositories for user into the current directory
#
if [ $# -eq 0 ]
  then
    echo "Usage: $0 <user_name> "
    exit;
fi

REPO_LIST=$(curl -s "https://gitlab.com/api/v4/users/$1/projects?per_page=100" | jq -r '.[].ssh_url_to_repo')

for repo in $REPO_LIST;do
 
  repo_name=${repo%.git}
  #repo_name=${repo_name#https://github.com/$1/}

  if [ -d "$repo_name" ];
    then
      cd $repo_name;
      git pull;
      cd ..
    else
      git clone $repo;
  fi
done;