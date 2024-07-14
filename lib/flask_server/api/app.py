# api/app.py
from flask import Flask, request, jsonify
from flask_cors import CORS
from .models import db
from .controllers import executar_comando, ler_dado
from scripts.boe import execute_boe


def create_app():
    app = Flask(__name__)

    # Configurações
    app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///comandos.db'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    # Inicializa extensões
    db.init_app(app)

    # Habilita CORS (apenas para desenvolvimento, ajuste conforme necessário)
    CORS(app)

    # Registra blueprints (rotas)
    app.add_url_rule('/api/comando', 'executar_comando', executar_comando, methods=['POST'])
    app.add_url_rule('/api/ler', 'ler_dado', ler_dado, methods=['GET'])

    return app

@app.route('/execute_boe', methods=['POST'])
def execute_boe_route():
    data = request.json
    param1 = data.get('param1')
    param2 = data.get('param2')
    
    result = execute_boe(param1, param2)
    
    return jsonify({'result': result})


if __name__ == '__main__':
    app = create_app()
    app.run(debug=True)
