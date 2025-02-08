## Para acesso externo ao NGINX rodando dentro do Pod com Kind na EC2

1. Criar cluster com configuração de mapeamento de porta
    ```bash
    kind create cluster --config kind-config.yaml
    ```

#

2. Executar o Pod, ReplicaSet ou Deployment (escolha um dos três)
    - Para rodar o `pod.yaml`
      ```bash
      kubectl apply -f pod.yaml
      ```
    - Para rodar o `replicaset.yaml`
      ```bash
      kubectl apply -f replicaset.yaml
      ```

    - Para rodar o `deployment.yaml`
      ```bash
      kubectl apply -f deployment.yaml
      ```

#

3. Aplicar o serviço para expor o Pod, ReplicaSet ou Deployment via NodePort:
    - Para Pod:
      ```bash
      kubectl apply -f nodeport-service.yaml
      ```

    - Para ReplicaSet:
      ```bash
      kubectl apply -f nodeport-service-for-replicaset.yaml
      ```

    - Para Deployment:
      ```bash
      kubectl apply -f nodeport-service-for-deployment.yaml
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
