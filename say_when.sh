#!/bin/sh
VOICES=./mac_os_voices.txt
ALL=false
VOICE="Anna"
CONTENT="Welcome to blyte town"
VERBOSE=false

# make out directory if it doesn't exist
if [ ! -d "./out" ]; then
    mkdir -p ./out
fi

# Check if voices file exists, create it if not
if [ ! -f "$VOICES" ]; then
    echo "[!] Voice list not found. Creating it now..."
    ./utils/say_create_list.sh
fi

# Parse command line arguments
while [ "$#" -gt 0 ]; do
  case "$1" in
    --voice)
      ALL=false
      VOICE="$2"
      shift 2
      ;;
    --all)
      ALL=true
      shift
      ;;
    --content)
      CONTENT="$2"
      shift 2
      ;;
    --verbose)
      VERBOSE=true
      shift
      ;;
    *)
      echo "Unknown parameter: $1"
      echo "Usage: say_when.sh [--voice <voice> | --all] [--content <content>] [--verbose]"
      exit 1
      ;;
  esac
done

# process all voices if --all flag is set
if [ "$ALL" = true ]; then
    # read the input file line by line
    while read -r VOICE_ENTRY; do
        if [ "$VERBOSE" = true ]; then
            # Run say command with output when verbose
            say -r 200 -v "$VOICE_ENTRY" "I am $VOICE_ENTRY, $CONTENT"
        fi

        # Always run say_voice.sh with no output control (it handles its own output)
        ./utils/say_voice.sh "$VOICE_ENTRY" "$CONTENT"

        echo "[✓] Processed voice: $VOICE_ENTRY"
    done < "$VOICES"
    wait
else
    # Process single voice with content
    if [ "$VERBOSE" = true ]; then
        # Run say command with output when verbose
        say -r 200 -v "$VOICE" "I am $VOICE, $CONTENT"
    fi

    # Run say_voice.sh with no output control
    ./utils/say_voice.sh "$VOICE" "$CONTENT"

    echo "[✓] Processed voice: $VOICE"
fi
