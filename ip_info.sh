#!/bin/bash

read -p "🌐 Insira o IP: " ip

echo -e "\n🔍 Buscando informações com WHOIS...\n"

# Verifica se o IP é válido (formato IPv4)
if [[ "$ip" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo -e "🆔 \e[1;32mIP informado:\e[0m $ip"
  echo -e "📡 \e[1;32mFormato:\e[0m IPv4"
  echo -e "\n📋 \e[1;34mInformações WHOIS:\e[0m\n"

  # Executa WHOIS e filtra campos relevantes
  whois $ip | grep -Ei 'OrgName|Country|NetRange|CIDR|City|State|Address|ISP|Organization|descr|owner' | while read -r linha; do
    echo -e "🔸 \e[1;36m$linha\e[0m"
  done
else
  echo -e "❌ \e[1;31mErro:\e[0m IP inválido ou formato incorreto."
fi