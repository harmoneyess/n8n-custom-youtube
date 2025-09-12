# Custom n8n with ffmpeg and YouTube node
FROM n8nio/n8n:latest

USER root

# Install ffmpeg
RUN apk add --no-cache ffmpeg git

# Install YouTube custom node
RUN mkdir -p /home/node/.n8n/custom && \
    git clone https://github.com/Gh05d/n8n-nodes-youtube.git /home/node/.n8n/custom/n8n-nodes-youtube && \
    cd /home/node/.n8n/custom/n8n-nodes-youtube && \
    npm install && npm run build

# Copy entrypoint
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

USER node

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
