#!/bin/bash

# Script de configuración inicial para servidores Ubuntu (ideal para EC2 o VMs locales)

set -euo pipefail

CURRENT_USER=$(whoami)

echo "🔄 Actualizando el sistema..."
sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y
echo "✅ Sistema actualizado."

echo "🔧 Verificando Git..."
if ! command -v git &>/dev/null; then
    echo "📦 Git no está instalado. Procediendo con la instalación..."
    sudo apt install git -y
else
    echo "✅ Git ya está instalado."
fi

echo "🐳 Verificando Docker..."
if ! command -v docker &>/dev/null; then
    echo "📦 Docker no encontrado. Procediendo con instalación..."

    # Limpieza de instalaciones anteriores
    sudo apt remove -y docker.io docker-doc docker-compose docker-ce docker-ce-cli \
         containerd.io docker-buildx-plugin docker-compose-plugin golang-docker-credential-helpers || true

    # Dependencias y repositorio
    sudo apt install -y ca-certificates curl gnupg lsb-release
    sudo mkdir -p /etc/apt/keyrings
    sudo rm -f /etc/apt/keyrings/docker.gpg
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
        sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt update -y
    sudo apt install -y docker-ce docker-ce-cli containerd.io \
                        docker-buildx-plugin docker-compose-plugin

    echo "➕ Añadiendo usuario '$CURRENT_USER' al grupo 'docker'..."
    sudo usermod -aG docker "$CURRENT_USER"

    echo "✅ Docker instalado."
    echo "ℹ️  Recuerda cerrar y volver a abrir tu sesión SSH para que los cambios surtan efecto."
else
    echo "✅ Docker ya está instalado."
fi

echo "🏁 Script de configuración completado con éxito."
