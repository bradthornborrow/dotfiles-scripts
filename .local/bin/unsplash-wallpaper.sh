#!/usr/bin/env bash

# Configuration
ACCESS_KEY="YOUR_UNSPLASH_ACCESS_KEY"
SAVE_DIR="$HOME/Pictures/Wallpapers"
QUERY="nature,landscape" # Optional: comma-separated search terms
ORIENTATION="landscape"  # Options: landscape, portrait, squarish

# Ensure save directory exists
mkdir -p "$SAVE_DIR"

# 1. Fetch random photo metadata from the Unsplash API
API_URL="https://unsplash.com{QUERY}&orientation=${ORIENTATION}&client_id=${ACCESS_KEY}"
RESPONSE=$(curl -s "$API_URL")

# 2. Parse the full-resolution image URL and Photo ID using jq
IMAGE_URL=$(echo "$RESPONSE" | jq -r '.urls.full')
PHOTO_ID=$(echo "$RESPONSE" | jq -r '.id')

# Verify a valid URL was returned
if [[ -z "$IMAGE_URL" || "$IMAGE_URL" == "null" ]]; then
    echo "Error: Failed to fetch image URL. Check your Access Key or rate limits."
    exit 1
fi

# 3. Download the wallpaper
FILE_PATH="${SAVE_DIR}/unsplash_${PHOTO_ID}.jpg"
curl -s -L "$IMAGE_URL" -o "$FILE_PATH"

echo "Downloaded wallpaper to: $FILE_PATH"

