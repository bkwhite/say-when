# Say when!

This is a simple tool written in Bash that allows for the automation of the MacOS `$ say` command.

I created this tool to help create a series of audio files containing each letter of the alphabet spoken by a specific voice. The output is used to create a Animal Crossing style voice for games.


## Usage

The main script is `say_when.sh`. It can be used to generate audio files for a specific voice or for all available voices.

```
say_when.sh [--voice <voice> | --all] [--content <content>] [--verbose]
```

`--voice <voice>`: Specify the voice to use for the audio files. Use `say -v ?` to list available voices.

`--all`: Generate audio files for all available voices.

`--content <content>`: Specify the content to be spoken.

`--verbose`: Enable "verbose" output ;)

The first time you run `say_when.sh`, it will create a file named `mac_os_voices.txt`. This file contains a list of all available voices on your system.

`say_when.sh` uses `utils/say_voice.sh` to handle the actual call to the `$ say` command.

## Dependencies

- `say` command from MacOS
- `lame` can be installed using Homebrew, it is used to convert .aiff files to .mp3 files
