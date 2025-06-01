# Projeto - Balanceamento de carga com Nginx e Deploy Automatizado com GitHub Actions via SSH

Este projeto demonstra um balanceamento de cargas utilizando Nginx, onde há duas instâncias rodando via python3 -m http.server nas portas 8081 e 8082.  automação de deploy em uma máquina virtual (EC2) utilizando GitHub Actions e acesso SSH via chave.  

## 🚀 Tecnologias
- GitHub Actions
- Ubuntu Server (VM) - AWS
- Nginx
- Deploy via SSH

## ⚙️ Configuração
1. Com o servidor UP(funcionando), instalar os pacotes necessários que iremos utilizar(nginx,git, python3).Segue abaixo:
    ```bash 
    apt install nginx git python3 python3-pip -y

2. Criar os dirtórios abaixo:
    ```bash
    mkdir infra-devops-hw
    mkdir -p /var/www/html/instancia{1,2}
    
3. Acessar o diretório criado (infra-devops-hw) 
    ```bash
    cd infra-devops-hw
    mkdir -p .github/workflows app/instancia1 app/instancia2 scripts nginx
    
4. Criar os arquivos (index1.html, index2.html).Está localizado no (app).Será utilizado para uma das partes do projeto. Balanceamento com NGINX.
    ```bash
    vim app/index1.html
    vim app/index2.html

5. Editar o arquivo NGINX
    ```bash
    vim /etc/nginx/sites-available/default e colar as linhas abaixo:
    ```bash
    server {
    listen 80;
    server_name 54.224.183.226;  
    location / {
        proxy_pass http://backend;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
upstream backend {
    server 127.0.0.1:8081;  # Instância 1 do seu app
    server 127.0.0.1:8082;  # Instância 2 do seu app
}

 
1. Gere uma chave SSH para uso exclusivo do GitHub Actions:
   ```bash
   ssh-keygen -t rsa -b 4096 -C "github-actions-deploy" -f ~/.ssh/github-actions-key

---

## 📁 Estrutura do Projeto

infra-devops-hw/
├── app/
│ ├── index1.html
│ └── index2.html
├── scripts/
│ └── deploy.sh
├── nginx/
├── bkp.yml
└── .github/
└── workflows/
└── deploy.yml


---

## ⚙️ Workflow GitHub Actions

- O workflow `deploy.yml` é acionado automaticamente após o push para o repositório.
- Utiliza a action [`appleboy/ssh-action`](https://github.com/appleboy/ssh-action) para conectar no servidor via SSH.
- Executa o script `deploy.sh`, que:
  - Lista os arquivos no diretório `app/`;
  - Copia os arquivos HTML para `/var/www/html` no servidor remoto.

---

## 🔐 Segurança

- As credenciais SSH são armazenadas como **secrets no GitHub**:
  - `HOST` — Endereço do servidor;
  - `USERNAME` — Usuário SSH;
  - `KEY` — Chave privada;
- O script é executado sem interação e exige permissões apropriadas para gravar no diretório de destino.

---

## ✅ Resultado do Deploy

- Conexão SSH estabelecida com sucesso.
- Arquivos `index1.html` e `index2.html` copiados para o servidor.
- Conteúdo estático disponível via navegador, servido pelo NGINX (ou servidor configurado no destino).

---


## 📸 Prints do item 1 - Configuração da Máquina Virtual - AWS EC2 UBUNTU

![image](https://github.com/user-attachments/assets/fb4d390c-9b93-46ca-9cd5-f96229db4036)
![image](https://github.com/user-attachments/assets/2a4e50db-3a84-4991-a2c7-95fa5f287e46)


## 📸 Prints do item 2 - 2. GitHub Actions 
![image](https://github.com/user-attachments/assets/3c568f0a-8616-4eb5-a7bc-b9d378651c98)
![image](https://github.com/user-attachments/assets/6f1ccbc2-b369-4591-bd21-fb65d082a5eb)








