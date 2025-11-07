#!/bin/bash

read -p "📞 Digite o número de celular + : " numero

echo -e "\n🔍 Buscando informações...\n"

resposta=$(curl -s "https://api.apilayer.com/number_verification/validate?number=$numero" \
  -H "apikey: DzqMp1I6EaaVl9gBv9WIU1ycKyjaMAyc")

valido=$(echo "$resposta" | jq -r '.valid')

if [ "$valido" == "true" ]; then
  numero_formatado=$(echo "$resposta" | jq -r '.international_format')
  local_format=$(echo "$resposta" | jq -r '.local_format')
  prefixo=$(echo "$resposta" | jq -r '.country_prefix')
  codigo=$(echo "$resposta" | jq -r '.country_code')
  pais=$(echo "$resposta" | jq -r '.country_name')
  localizacao=$(echo "$resposta" | jq -r '.location')
  operadora=$(echo "$resposta" | jq -r '.carrier')
  tipo=$(echo "$resposta" | jq -r '.line_type')

  echo -e "📱 \e[1;32mNúmero:\e[0m $numero_formatado"
  echo -e "📍 \e[1;32mLocalização:\e[0m $localizacao"
  echo -e "🌎 \e[1;32mPaís:\e[0m $pais ($codigo)"
  echo -e "🔢 \e[1;32mPrefixo:\e[0m $prefixo"
  echo -e "📞 \e[1;32mFormato local:\e[0m $local_format"
  echo -e "🏢 \e[1;32mOperadora:\e[0m $operadora"
  echo -e "📶 \e[1;32mTipo de linha:\e[0m $tipo"
else
  mensagem=$(echo "$resposta" | jq -r '.error.info // "Número inválido ou erro na API."')
  echo -e "❌ \e[1;31mErro:\e[0m $mensagem"
fi