#!/bin/bash

# Переменные
FORK_URL="https://github.com/Patebash/shvirtd-example-python.git"
PROJECT_DIR="/opt/shvirtd-example-python"

# Клонируем форк

sudo git clone "$FORK_URL" "$PROJECT_DIR"
cd "$PROJECT_DIR" || exit

# Установка Docker из официального репозитория

sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Запуск проекта через Docker Compose

sudo docker compose up -d


echo "Проект запущен успешно!"
