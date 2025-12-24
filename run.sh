docker build -f Dockerfile -t get-audio:latest .

docker run --rm -v "$(pwd)/audio:/audio" get-audio:latest
