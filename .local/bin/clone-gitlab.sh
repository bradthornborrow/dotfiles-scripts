#!/bin/bash
TOKEN="YOUR_ACCESS_TOKEN"
USER_ID="YOUR_USER_ID"
GITLAB_URL="https://gitlab.com"

# Fetch all project SSH URLs for the user
REPOS=$(curl --header "Private-Token: $TOKEN" "$GITLAB_URL/api/v4/users/$USER_ID/projects?per_page=100" | jq -r '.[].ssh_url_to_repo')

# Loop through and clone
for REPO in $REPOS; do
    git clone "$REPO"
done

for repo in $(curl -s "https://gitlab.com/api/v4/users/bradthornborrow/projects?per_page=100" | jq -r '.[].ssh_url_to_repo'); do git clone $repo; done;
