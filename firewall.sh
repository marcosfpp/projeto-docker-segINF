#!/bin/sh

echo "Iniciando configuracao do Firewall (Iptables)..."

# 1. Limpa todas as regras e cadeias existentes (Reset)
iptables -F
iptables -X

# 2. Define a politica padrao de Roteamento (FORWARD) como DROP
# Se o pacote nao combinar com nenhuma regra abaixo, ele sera destruido.
iptables -P FORWARD DROP

# 3. Regra Stateful: Permite o tráfego de retorno
# Se a LAN iniciou a conversa (ex: acessou o site), permitimos que a DMZ responda.
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# 4. Regra de Liberacao: LAN acessando o Servidor Web (DMZ) na porta 80 (HTTP)
iptables -A FORWARD -s 192.168.10.0/24 -d 172.16.20.10 -p tcp --dport 80 -j ACCEPT

# 5. Regra de Bloqueio Explicito (Opcional, pois a politica padrao ja bloqueia, mas excelente para evidenciar no relatorio)
# Bloqueia a LAN de acessar a porta 3306 (MySQL/MariaDB)
iptables -A FORWARD -s 192.168.10.0/24 -d 172.16.20.20 -p tcp --dport 3306 -j DROP

echo "Regras de Firewall funcionando!"

# Mantem o container vivo
tail -f /dev/null