import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


// Replace with your actual backend API URL
const String apiUrl = 'http://localhost:5000/api/';

class CommandScreen extends StatefulWidget {
  const CommandScreen({super.key});

  @override
  _CommandScreenState createState() => _CommandScreenState();
}

class _CommandScreenState extends State<CommandScreen> {
  // Variables to hold data
  String commandText = '';
  String responseText = '';

  // Function to send a command to the backend
  Future<void> sendCommand(String command) async {
    final response = await http.post(
      Uri.parse('${apiUrl}command'),
      body: {'command': command},
    );

    if (response.statusCode == 200) {
      setState(() {
        responseText = response.body;
      });
    } else {
      print('Error sending command: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interface de Comandos'),
      ),
      body: SingleChildScrollView( // Ensures scrollable content
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Command Text Field
            TextField(
              decoration: const InputDecoration(labelText: 'Comando'),
              onChanged: (value) {
                setState(() {
                  commandText = value;
                });
              },
            ),
            const SizedBox(height: 20.0), // Spacing between elements

            // Row for buttons (assuming two buttons)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => sendCommand(commandText),
                  child: const Text('Enviar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add functionality for button 2 (clear or similar)
                    setState(() {
                      commandText = '';
                      responseText = '';
                    });
                  },
                  child: const Text('Limpar'),
                ),
              ],
            ),
            const SizedBox(height: 20.0), // Spacing between elements

            // Response Text
            const Text('Resposta:', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10.0),
            Text(responseText),
          ],
        ),
      ),
    );
  }
}
