import 'package:flutter/material.dart';
import '../services/api_service.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  final ApiService apiService = ApiService();
  Map<String, dynamic>? data;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var result = await apiService.fetchData('endpoint');
      setState(() {
        data = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Trate o erro conforme necessário
      print('Erro ao carregar dados: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      color: Colors.white,
      child: const Column(
        children: <Widget>[
          // Use 'data' para exibir os dados na UI
        ],
      ),
    );
  }
}
