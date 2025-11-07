from flask import Flask, render_template, request
import datetime
import requests

app = Flask(__name__)

def coordenadas_para_endereco(lat, lon):
    try:
        url = f"https://nominatim.openstreetmap.org/reverse?format=json&lat={lat}&lon={lon}&zoom=18&addressdetails=1"
        headers = {'User-Agent': 'JulsonTool'}
        resposta = requests.get(url, headers=headers)
        dados = resposta.json()
        return dados.get('display_name', 'Endereço não encontrado')
    except:
        return 'Erro ao buscar endereço'

@app.route('/', methods=['GET', 'POST'])
def index():
    ip = request.remote_addr
    horario = datetime.datetime.now().strftime("%d/%m/%Y %H:%M:%S")

    print(f"\n🌐 Novo acesso detectado do IP: {ip} às {horario}")

    if request.method == 'POST':
        nome = request.form.get('nome')
        contato = request.form.get('contato')
        latitude = request.form.get('latitude')
        longitude = request.form.get('longitude')
        endereco = coordenadas_para_endereco(latitude, longitude)
        modelo = request.user_agent.string
        navegador = request.user_agent.browser
        plataforma = request.user_agent.platform
        idioma = request.accept_languages.best
        mapa = f"https://www.google.com/maps?q={latitude},{longitude}"

        print("📥 Nova inscrição recebida:")
        print(f"🧑 Nome: {nome}")
        print(f"📞 Contato: {contato}")
        print(f"📍 Localização: {latitude}, {longitude}")
        print(f"🏠 Endereço: {endereco}")
        print(f"🗺️ Link do mapa: {mapa}")
        print(f"📱 Dispositivo: {modelo}")
        print(f"🧭 Navegador: {navegador}")
        print(f"💻 Plataforma: {plataforma}")
        print(f"🗣️ Idioma: {idioma}")
        print(f"🕒 Horário: {horario}")
        return "✅ Inscrição recebida com sucesso!"
    
    return render_template('index.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5005)