# Custom n8n with ffmpeg and YouTube node
FROM n8nio/n8n:latest

# Install ffmpeg
USER root
RUN apk add --no-cache ffmpeg git

# Switch back to node user
USER node

# Install YouTube community node into custom folder
RUN mkdir -p /home/node/.n8n/custom     && git clone https://github.com/n8n-io/n8n-nodes-youtube.git /home/node/.n8n/custom/n8n-nodes-youtube     && cd /home/node/.n8n/custom/n8n-nodes-youtube     && npm install     && npm run build || true

WORKDIR /data

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]

EXPOSE 5678/tcp
