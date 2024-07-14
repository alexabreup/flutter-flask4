import 'package:flutter/material.dart';
// import 'package:flutter_app/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  List<String> _commands = [];

  @override
  void initState() {
    super.initState();
    _loadCommands();
  }

  Future<void> _loadCommands() async {
    try {
      List<String> commands = await _apiService.fetchCommands();
      setState(() {
        _commands = commands;
      });
    } catch (e) {
      print('Erro ao carregar comandos: $e');
      // Tratar erro de forma adequada
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comandos do Backend Flask'),
      ),
      body: _commands.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _commands.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_commands[index]),
                );
              },
            ),
    );
  }
}
