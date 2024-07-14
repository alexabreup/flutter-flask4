import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.blue,
      child: const Column(
        children: <Widget>[
          // Adicione os itens do menu aqui
        ],
      ),
    );
  }
}
