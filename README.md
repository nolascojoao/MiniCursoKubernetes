# Estudos com Kubernetes em EC2 

Repositório para estudos com Kubernetes usando Kind, kubectl e Docker em uma instância EC2 t2.micro com Amazon Linux 2023 AMI.

## Configuração Inicial
  - Opção 1: Via User Data
    - Copie o conteúdo de `userdata.sh` e cole no User data ao lançar a instância EC2.
  
  - Opção 2: Manual
    - Dê permissão ao script:
    ```bash
    sudo chmod +x setup-kind.sh
    ```
    - Execute:
    ```bash
    ./setup-kind.sh
    ```
