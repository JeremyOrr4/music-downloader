FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y \
        ffmpeg \
        curl \
        jq && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir yt-dlp

WORKDIR /app

COPY playlists.json /app/playlists.json
COPY get_audio.sh /app/get_audio.sh
RUN chmod +x /app/get_audio.sh

CMD ["/bin/bash", "/app/get_audio.sh"]
