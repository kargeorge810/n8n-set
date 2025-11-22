FROM n8nio/n8n:latest

USER root

# Устанавливаем необходимые пакеты
RUN apk update && \
    apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    && rm -rf /var/cache/apk/*

# Создаём виртуальное окружение и устанавливаем пакеты
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir \
    yt-dlp \
    easyocr \
    pillow \
    && ln -s /opt/venv/bin/yt-dlp /usr/local/bin/yt-dlp

USER node

EXPOSE 5678
