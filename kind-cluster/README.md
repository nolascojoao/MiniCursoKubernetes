## Para acesso externo ao NGINX rodando dentro do Pod com Kind na EC2

1. Criar cluster com configuração de mapeamento de porta
```bash
kind create cluster --config kind-config.yaml
```

2. Aplicar o `pod.yaml`
```bash
kubectl apply -f pod.yaml
```

3. Aplicar o serviço para expor o Pod via NodePort e permitir acesso público
```bash
kubectl apply -f nodeport-service.yaml
```

4. Verificar o status do serviço
```bash
kubectl describe services nginx-service
```

5. Acessar o serviço externamente
```bash
http://<IP-da-instância-EC2>:30080
```
