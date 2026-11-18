#!/usr/bin/env bash

# Configuration
ACCESS_KEY="$UNSPLASH_API_KEY"
SAVE_DIR="$HOME/Pictures/Wallpaper"
QUERY="night" # Optional: comma-separated search terms
ORIENTATION="landscape"  # Options: landscape, portrait, squarish

# Ensure save directory exists
mkdir -p "$SAVE_DIR"

# 1. Fetch random photo metadata from the Unsplash API
API_URL="https://api.unsplash.com/photos/random?query=${QUERY}&orientation=${ORIENTATION}&client_id=${ACCESS_KEY}"
RESPONSE=$(curl -s "$API_URL")

# 2. Parse the full-resolution image URL and Photo ID using jq
IMAGE_URL=$(echo "$RESPONSE" | jq -r '.urls.full')
PHOTO_ID=$(echo "$RESPONSE" | jq -r '.slug')

# Verify a valid URL was returned
if [[ -z "$IMAGE_URL" || "$IMAGE_URL" == "null" ]]; then
    echo "Error: Failed to fetch image URL. Check your Access Key or rate limits."
    exit 1
fi

# 3. Download the wallpaper
FILE_PATH="${SAVE_DIR}/Unsplash_${PHOTO_ID}.jpeg"
curl -s -L "$IMAGE_URL" -o "$FILE_PATH"

echo "Downloaded wallpaper to: $FILE_PATH"

# 4. Set background to new wallpaper file
if [ "$GDMSESSION" == "gnome" ] || [ "$GDMSESSION" == "ubuntu" ]; then
    gsettings set org.gnome.desktop.background picture-uri "file://$FILE_PATH"
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$FILE_PATH"
else
    feh --bg-scale "$FILE_PATH"
fi
