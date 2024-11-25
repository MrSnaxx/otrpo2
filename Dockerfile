# Используем базовый образ Python
FROM python:3.9-slim

# Устанавливаем зависимости для OpenCV
RUN apt-get update && apt-get install -y \
    libsm6 libxext6 libxrender-dev libglib2.0-0 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Устанавливаем OpenCV
RUN pip install --no-cache-dir opencv-python-headless

# Копируем ваш скрипт в контейнер
WORKDIR /app
COPY main.py .

# Указываем точку входа для выполнения скрипта
ENTRYPOINT ["python", "main.py"]
