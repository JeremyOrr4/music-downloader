# Music Downloader

A simple script to download music from YouTube playlists locally using Docker and `yt-dlp`.

## Features

* Downloads audio from YouTube playlists.
* Saves files as MP3 in a local folder.
* Works entirely inside a Docker container.

## Requirements

* [Docker](https://www.docker.com/) installed on your system.
* Make sure Docker is running before using the script.

## Tips

* If you want to downlaod an album, the link can also be a playlist link which will download the whole playlist.
* Example, see https://www.youtube.com/watch?v=4oPA8JUttCw&list=PLWnwFAnZO1AHV5_IJOqhidY2iYgcc9ulD

* Sometimes if you have a youtube link, it will also download all the auto play songs as well. To make sure it doesnt, make sure your link has no `&`. Double check its just a video only.

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
