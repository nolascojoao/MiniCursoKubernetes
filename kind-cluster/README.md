## Para acesso externo ao NGINX rodando dentro do Pod com Kind na EC2

1. Criar cluster com configuração de mapeamento de porta
    ```bash
    kind create cluster --config kind-config.yaml
    ```

#

2. Executar o Pod ou ReplicaSet (escolha um dos dois)
    - Para rodar o `pod.yaml`
      ```bash
      kubectl apply -f pod.yaml
      ```
    - Para rodar o `replicaset.yaml`
      ```bash
      kubectl apply -f replicaset.yaml
      ```

#

3. Aplicar o serviço para expor o Pod ou ReplicaSet via NodePort:
    - Para Pod:
      ```bash
      kubectl apply -f nodeport-service.yaml
      ```
    - Para ReplicaSet:
      ```bash
      kubectl apply -f nodeport-service-for-replicaset.yaml
      ```

#

4. Verificar o status do serviço
    ```bash
    kubectl describe services nginx-service
    ```

#

5. Acessar o serviço externamente
    ```bash
    http://<IP-da-instância-EC2>:30080
    ```

---

- Libere a porta 30080 no Security Group da EC2 🔔 
