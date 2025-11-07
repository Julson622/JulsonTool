#!/bin/bash

clear
figlet "JulsonTool" | lolcat
echo "🔧 Farramenta do JulsonTool"
echo -e "\e[1;32m🔧 Utilitário hacker para Termux\e[0m"
echo -e "\e[1;34m👤 By Julson Julião Paiva\e[0m"
echo ""
echo "[01] Informações do número de celular"
echo "[02] Informações do IP"
echo "[03] Localização via site"
echo "[04] Consultas do Domínio de links"
echo "[00] Sair"
echo ""
read -p "Escolha uma opção: " opcao

case $opcao in
  01)
    bash celular_info.sh
    echo ""
    read -p "Pressione ENTER para voltar ao menu..."
    exec bash julson.sh
    ;;

  02)
    bash ip_info.sh
    echo ""
    read -p "Pressione ENTER para voltar ao menu..."
    exec bash julson.sh
    ;;

  03)
    echo "🔍 Verificando se a porta 5005 está ocupada..."
    pid=$(lsof -ti:5005)

    if [ -n "$pid" ]; then
      echo "⚠️ Porta 5005 está em uso pelo processo $pid. Finalizando..."
      kill -9 $pid
      sleep 1
      echo "✅ Processo encerrado com sucesso."
    else
      echo "✅ Porta 5005 está livre."
    fi

    echo "🚀 Iniciando servidor Flask em localhost:5005..."
    cd site_localizacao
    python3 app.py
    ;;

  04)
  echo "🌐 Consulta WHOIS de domínio (filtrada com emojis)"
  read -p "🔎 Digite o domínio (ex: google.com): " dominio

  if [ -z "$dominio" ]; then
    echo "❌ O domínio não pode estar vazio."
  else
    echo "⏳ Consultando informações sobre $dominio..."
    resultado=$(whois "$dominio")

    nome=$(echo "$resultado" | grep -i "Domain Name:" | head -n1 | sed 's/Domain Name:/📝 Nome do Domínio:/')
    registrador=$(echo "$resultado" | grep -i "Registrar:" | grep -v "WHOIS Server" | head -n1 | sed 's/Registrar:/🏢 Registrado por:/')
    criado=$(echo "$resultado" | grep -i "Creation Date:" | head -n1 | sed 's/Creation Date:/📅 Criado em:/')
    expira=$(echo "$resultado" | grep -i "Expiry Date:" | head -n1 | sed 's/Expiry Date:/⏰ Expira em:/')
    atualizado=$(echo "$resultado" | grep -i "Updated Date:" | head -n1 | sed 's/Updated Date:/🔄 Atualizado em:/')
    status=$(echo "$resultado" | grep -i "Domain Status:" | cut -d ":" -f2 | sort -u | paste -sd ", " | sed 's/^/🔐 Status:/')
    ns=$(echo "$resultado" | grep -i "Name Server:" | cut -d ":" -f2 | paste -sd ", " | sed 's/^/🧭 Servidores DNS:/')

    echo ""
    echo "$nome"
    echo "$registrador"
    echo "$criado"
    echo "$expira"
    echo "$atualizado"
    echo "$status"
    echo "$ns"
    echo ""
    echo "✅ Consulta concluída com sucesso!"
  fi

  echo ""
  read -p "🔁 Pressione ENTER para voltar ao menu..."
  exec bash julson.sh
  ;;

  00)
    echo "👋 Saindo do JulsonTool... até mais!"
    exit
    ;;

  *)
    echo "❌ Opção inválida!"
    read -p "Pressione ENTER para voltar ao menu..."
    exec bash julson.sh
    ;;
esac