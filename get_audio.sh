#!/bin/bash
set -euo pipefail

JSON_FILE="playlists.json"
BASE_DIR="/audio"

mkdir -p "$BASE_DIR"

jq -c '.playlists[]' "$JSON_FILE" | while read -r entry; do
  url=$(echo "$entry" | jq -r '.url')
  downloaded=$(echo "$entry" | jq -r '.downloaded')

  if [ "$downloaded" = "true" ]; then
    echo "Skipping already downloaded playlist"
    continue
  fi

  echo "Downloading playlist: $url"

  yt-dlp \
    -i \
    -x \
    --audio-format mp3 \
    --embed-metadata \
    --embed-thumbnail \
    --parse-metadata "playlist_index:%(track_number)s" \
    --output "$BASE_DIR/%(artist|Unknown Artist)s/%(album|Unknown Album)s/%(playlist_index)02d - %(title)s.%(ext)s" \
    "$url"

  echo "Finished downloading playlist"

  # Mark as downloaded
  tmp=$(mktemp)
  jq --arg url "$url" '
    (.playlists[] | select(.url==$url)).downloaded = true
  ' "$JSON_FILE" > "$tmp" && mv "$tmp" "$JSON_FILE"

done
