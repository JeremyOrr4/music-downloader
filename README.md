# Music Downloader

A simple script to download music from YouTube playlists locally using Docker and `yt-dlp`.

## Features

* Downloads audio from YouTube playlists.
* Saves files as MP3 in a local folder.
* Works entirely inside a Docker container.

## Requirements

* [Docker](https://www.docker.com/) installed on your system.
* Make sure Docker is running before using the script.

## Usage

1. Make the script executable:

```bash
chmod +x run.sh
```

2. Change the `PLAYLIST_URL` variable in `run.sh` to the link of the playlist or song you want to download.

3. Run the script:

```bash
./run.sh
```

4. All downloaded audio files will appear in the `audio/` folder.
