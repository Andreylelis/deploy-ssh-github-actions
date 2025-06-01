# Projeto - Deploy Automatizado com GitHub Actions via SSH

Este projeto demonstra a automação de deploy em uma máquina virtual (EC2 ou similar) utilizando GitHub Actions e acesso SSH via chave.

## 🚀 Tecnologias
- GitHub Actions
- Ubuntu Server (VM)
- Nginx
- Deploy via SSH

## ⚙️ Configuração

1. Gere uma chave SSH para uso exclusivo do GitHub Actions:
   ```bash
   ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_deploy

# 🚀 Deploy Automatizado com GitHub Actions e SSH

Este projeto realiza o **deploy automático de arquivos HTML** para um servidor remoto utilizando **GitHub Actions** e conexão via **SSH**, de forma segura e prática.

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
![image](https://github.com/user-attachments/assets/843348b1-cf1f-499f-940f-03deac877573)





