// flask_server/flask_wrapper.dart
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FlaskServer {
  static const platform = MethodChannel('flask_wrapper');

  static Future<void> startServer() async {
    try {
      // Chama um método nativo para iniciar o servidor Flask
      final String result = await platform.invokeMethod('startServer');
      print('Servidor Flask iniciado: $result');
    } on PlatformException catch (e) {
      print('Erro ao iniciar o servidor Flask: ${e.message}');
    }
  }

  static Future<String> executarComando(String comando) async {
    String url = 'http://localhost:5000/api/comando';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, String> body = {'comando': comando};

    try {
      var response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data['resultado'];
      } else {
        return 'Erro ao executar o comando: ${response.statusCode}';
      }
    } catch (e) {
      return 'Erro de conexão: $e';
    }
  }
}
