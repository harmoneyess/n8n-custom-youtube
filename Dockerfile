FROM n8nio/n8n:latest

USER root

# Install dependencies for yt-dlp + FFmpeg
RUN apk add --no-cache \
    ffmpeg \
    bash \
    python3 \
    py3-pip \
    build-base \
    libffi-dev \
    git \
    curl \
    tzdata \
    && pip3 install --upgrade pip setuptools wheel \
    && pip3 install yt-dlp

USER node
WORKDIR /data

EXPOSE 5678

ENTRYPOINT ["n8n"]
