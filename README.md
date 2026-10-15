# GlowAgenda - Infraestrutura Segura com Docker

Projeto desenvolvido para a disciplina de Segurança da Informação (Prof. Roitier Campos Gonçalves) no IF Goiano - Campus Ceres.

## 📌 Objetivo
Este laboratório simula uma rede corporativa segmentada (LAN e DMZ) utilizando containers Docker, onde um container atua como Firewall/Gateway aplicando políticas de segurança Zero Trust via `iptables`.

## 🚀 Como executar o projeto

1. Certifique-se de ter o Docker e o Docker Compose (ou Docker Desktop) instalados e rodando.
2. Clone o repositório e acesse a pasta do projeto.
3. Suba a infraestrutura executando o comando:
   ```bash
   docker-compose up -d