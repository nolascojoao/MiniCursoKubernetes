#!/bin/bash

set -e

# Atualizar pacotes e instalar Docker
sudo yum update -y
sudo yum install -y docker
sudo systemctl enable --now docker
sudo usermod -aG docker $USER

# Baixar Kind para a arquitetura correta
ARCH=$(uname -m)
KIND_URL="https://kind.sigs.k8s.io/dl/v0.26.0/kind-linux-"

if [ "$ARCH" = "x86_64" ]; then
  KIND_URL+="amd64"
  KUBECTL_URL="https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
else
  KIND_URL+="arm64"
  KUBECTL_URL="https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
fi

curl -Lo ./kind "$KIND_URL"
curl -LO "$KUBECTL_URL"

chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Instalar kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Imprimir as versões instaladas
echo "Kind version:"
kind version

echo "Kubectl version:"
kubectl version --client

echo "Docker version:"
docker --version

echo "Instalação concluída! Reinicie a sessão ou execute 'newgrp docker'."
