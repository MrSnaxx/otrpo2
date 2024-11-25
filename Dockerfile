# Используем базовый образ Python
FROM python:3.9-slim

# Устанавливаем зависимости для системы
RUN apt-get update && apt-get install -y \
    libsm6 libxext6 libxrender-dev libglib2.0-0 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Устанавливаем Python-зависимости
RUN pip install --no-cache-dir opencv-python-headless

# Создаем рабочую директорию
WORKDIR /app

# Копируем Python-скрипт и изображение в контейнер
COPY main.py .
COPY photo.jpg .

# Указываем точку входа для выполнения скрипта
CMD ["python", "main.py"]
