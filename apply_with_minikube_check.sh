#!/bin/bash

# Script para validar el estado de Minikube y aplicar un manifiesto YAML con kubectl.

set -euo pipefail

ARCHIVO=${1:-rs.yaml}

echo "📦 Verificando estado de Minikube..."

if ! minikube status | grep -q "host: Running"; then
  echo "⚠️  Minikube no está corriendo. Intentando iniciar..."
  minikube start
else
  echo "✅ Minikube está activo."
fi

echo "🔧 Verificando contexto de kubectl..."
kubectl config use-context minikube

echo "📄 Aplicando manifiesto: $ARCHIVO"
kubectl apply -f "$ARCHIVO"

echo "🚀 ¡Manifiesto aplicado con éxito!"
