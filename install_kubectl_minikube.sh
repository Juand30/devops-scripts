#!/bin/bash

# Script para instalar kubectl y Minikube en Ubuntu (20.04+)
set -euo pipefail

echo "🔧 Instalando kubectl..."
if ! command -v kubectl &>/dev/null; then
  curl -LO "https://dl.k8s.io/release/$(curl -sL https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  chmod +x kubectl
  sudo mv kubectl /usr/local/bin/
else
  echo "✅ kubectl ya está instalado."
fi

echo "🐳 Verificando Docker como runtime..."
if ! command -v docker &>/dev/null; then
  echo "❌ Docker no está instalado. Este script asume que Docker ya está presente. Cancela aquí."
  exit 1
fi

echo "📦 Instalando Minikube..."
if ! command -v minikube &>/dev/null; then
  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  sudo install minikube-linux-amd64 /usr/local/bin/minikube
else
  echo "✅ Minikube ya está instalado."
fi

echo "🚀 Iniciando Minikube con Docker..."
minikube start --driver=docker

echo "📡 Verificando cluster..."
kubectl get nodes

echo "🎉 Entorno listo: kubectl + Minikube configurados correctamente."
