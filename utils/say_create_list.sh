#!/bin/sh
OUTPUT_FILE="mac_os_voices.txt"

# Run the say command and process its output
say -v ? | while read -r line; do
    # Extract the voice name (first word on each line)
    voice_name=$(echo "$line" | awk '{print $1}')

    # Skip empty lines
    if [ -n "$voice_name" ]; then
        echo "$voice_name" >> "$OUTPUT_FILE"
    fi
done

echo "[✓] Voice names extracted to $OUTPUT_FILE"
