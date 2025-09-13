FROM n8nio/n8n:latest

USER root
RUN apk add --no-cache ffmpeg python3 py3-pip bash git
RUN pip3 install yt-dlp
USER node

WORKDIR /data
EXPOSE 5678
ENTRYPOINT ["n8n"]
