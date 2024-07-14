from flask import Flask, request, jsonify
from scripts.boe import execute_boe
from scripts.schedule_RMC import criar_janela
from scripts.schedule_RMC_V2 import criar_janela
from scripts.schedule_RMC_V3 import criar_janela
from scripts.Interface_RMC_V4_0 import some_function_v4_0
from scripts.Interface_RMC_V5_0 import some_function_v5_0
from scripts.Interface_RMC_V6 import some_function_v6
# Importe outras funções conforme necessário

app = Flask(__name__)


@app.route('/execute_boe', methods=['POST'])
def execute_boe_route():
    data = request.json
    param1 = data.get('param1')
    param2 = data.get('param2')
    result = execute_boe(param1, param2)
    return jsonify({'result': result})

@app.route('/execute_v4_0', methods=['POST'])
def execute_v4_0_route():
    data = request.json
    param1 = data.get('param1')
    param2 = data.get('param2')
    result = some_function_v4_0(param1, param2)
    return jsonify({'result': result})

@app.route('/execute_v5_0', methods=['POST'])
def execute_v5_0_route():
    data = request.json
    param1 = data.get('param1')
    param2 = data.get('param2')
    result = some_function_v5_0(param1, param2)
    return jsonify({'result': result})

@app.route('/execute_v6', methods=['POST'])
def execute_v6_route():
    data = request.json
    param1 = data.get('param1')
    param2 = data.get('param2')
    result = some_function_v6(param1, param2)
    return jsonify({'result': result})

@app.route('/execute_schedule', methods=['POST'])
def execute_schedule_route():
    data = request.json
    param1 = data.get('param1')
    param2 = data.get('param2')
    result = some_function_schedule(param1, param2)
    return jsonify({'result': result})

@app.route('/execute_schedule_v2', methods=['POST'])
def execute_schedule_v2_route():
    data = request.json
    param1 = data.get('param1')
    param2 = data.get('param2')
    result = some_function_schedule_v2(param1, param2)
    return jsonify({'result': result})

@app.route('/execute_schedule_v3', methods=['POST'])
def execute_schedule_v3_route():
    data = request.json
    param1 = data.get('param1')
    param2 = data.get('param2')
    result = some_function_schedule_v3(param1, param2)
    return jsonify({'result': result})

if __name__ == '__main__':
    app.run(debug=True)
