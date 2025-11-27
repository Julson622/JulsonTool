<h1 align="center">🔧 JulsonTool</h1>

<p align="center">
  <img src="https://img.shields.io/badge/Versão-1.0-blueviolet" />
  <img src="https://img.shields.io/badge/Python-3%2B-green" />
  <img src="https://img.shields.io/badge/Status-Estável-brightgreen" />
  <img src="https://img.shields.io/badge/Licença-MIT-blue" />
</p>

---

## 🛠️ Sobre o Projeto

**JulsonTool** é um utilitário hacker educativo para **Termux**, criado por **Julson Julião Paiva (Julson622 no GitHub)**.  
O projeto reúne diversas ferramentas em um menu interativo para aprendizado de **pentest** e **segurança digital**.

> Este projeto é **open-source** e está em constante evolução. Use para aprender, nunca para fins ilegais. ⚠️

---

## 📦 Funcionalidades

- [01] Informações do número de celular  
- [02] Informações do IP  
- [03] Localização via site (Flask + Requests)  
- [04] Consultas WHOIS de domínios  
- [05] Login FreeFire (modo web)  
- [06] Login Facebook (modo web)  
- [07] Gerador de Google Dorks para Pentest  
- [08] Zphisher (educativo)  
- [09] Dos-attacX (simulador de ataque DoS)  
- [10] Detector Anti-DoS (educativo)

---

## ⚙️ Instalação

### Pré-requisitos

- [Termux](https://f-droid.org/en/packages/com.termux/)  
- Python 3+  
- Git  

### Passo a passo (Termux)

```bash
pkg update && pkg upgrade -y
pkg install git python python3 bash figlet ruby -y
gem install lolcat
termux-setup-storage

cd /storage/emulated/0/bot
git clone https://github.com/Julson622/JulsonTool.git
cd JulsonTool
chmod +x installer/install.sh
./installer/install.sh
bash julson.sh