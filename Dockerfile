# Custom n8n with ffmpeg and YouTube node
# Use official n8n image as base
FROM n8nio/n8n:latest

# Switch to root to install dependencies
USER root

# Install ffmpeg and bash
RUN apk add --no-cache ffmpeg bash

# Switch back to n8n user
USER node

# Set working directory
WORKDIR /data

# Expose n8n port
EXPOSE 5678

# Default command
ENTRYPOINT ["n8n"]
