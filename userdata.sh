#!/bin/bash
set -e

# Atualizar pacotes e instalar Docker
sudo yum install -y docker
sudo systemctl enable --now docker
sudo usermod -aG docker ec2-user

# Baixar Kind e kubectl para a arquitetura correta
ARCH=$(uname -m)
KIND_URL="https://kind.sigs.k8s.io/dl/v0.26.0/kind-linux-"
KUBECTL_URL="https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/"

if [ "$ARCH" = "x86_64" ]; then
  KIND_URL+="amd64"
  KUBECTL_URL+="amd64/kubectl"
else
  KIND_URL+="arm64"
  KUBECTL_URL+="arm64/kubectl"
fi

curl -Lo ./kind "$KIND_URL"
curl -LO "$KUBECTL_URL"

chmod +x ./kind ./kubectl
sudo mv ./kind /usr/local/bin/kind
sudo mv ./kubectl /usr/local/bin/kubectl
