#!/bin/sh
VOICE=$1
CONTENT=$2

# Sanitize voice name for folder creation
SAFE_FILE_NAME=$(echo "$VOICE" | sed -E 's/[^A-Za-z0-9._-]+/_/g; s/^_//; s/_$//')
SAFE_VOICE_FILE_NAME=$(echo "$SAFE_FILE_NAME" | tr '[:upper:]' '[:lower:]')
FOLDERNAME=./out/$SAFE_VOICE_FILE_NAME

# Create sanitized content for filename
SAFE_CONTENT=$(echo "$CONTENT" | sed -E 's/[^A-Za-z0-9._-]+/_/g; s/^_//; s/_$//')

FILENAME="$FOLDERNAME/$SAFE_CONTENT"

# Create output directory if it doesn't exist
if [ ! -d "$FOLDERNAME" ]; then
    mkdir -p "$FOLDERNAME"
fi

# Generate audio using macOS 'say' command
say -v "$VOICE" "$CONTENT" -o "$FILENAME.aiff"

# Convert to MP3
lame --silent -m m "$FILENAME.aiff" "$FILENAME.mp3"

# Clean up temporary AIFF file
rm "$FILENAME.aiff"
