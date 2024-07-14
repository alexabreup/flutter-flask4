import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String selectedCommand = 'Configurations Commands';
  List<String> configurationCommands = ['1', '2', '3', '4', '5', '6', '7'];
  List<String> readCommands = ['8', '9', '10', '11', '12', '13', '14'];
  List<String> currentCommands = [];
  String selectedDropdownItem = '';

  Map<int, bool> relayStates = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
  };

  TextEditingController commandController = TextEditingController();
  TextEditingController ackController = TextEditingController();
  TextEditingController ipController = TextEditingController();
  TextEditingController portController = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentCommands = configurationCommands;
  }

  void handleCommandTypeChange(String commandType) {
    setState(() {
      selectedCommand = commandType;
      currentCommands = commandType == 'Configurations Commands'
          ? configurationCommands
          : readCommands;
      selectedDropdownItem = '';
    });
  }

  void handleRelayToggle(int relayIndex) {
    setState(() {
      relayStates[relayIndex] = !relayStates[relayIndex]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interface de Comandos Eletromidia'),
        backgroundColor: const Color.fromARGB(255, 255, 102, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Command Buttons and Dropdown
            Row(
              children: <Widget>[
                _buildCommandButton('Configurations Commands'),
                const SizedBox(width: 10),
                _buildCommandButton('Read Commands'),
                const SizedBox(width: 10),
                _buildDropdown(),
              ],
            ),
            const SizedBox(height: 20),
            // Relay Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(6, (index) {
                return _buildRelayButton(index);
              }),
            ),
            const SizedBox(height: 20),
            // Command and ACK Text Boxes
            _buildTextBox('Command', commandController),
            const SizedBox(height: 10),
            _buildTextBox('ACK (Answer)', ackController),
            const SizedBox(height: 20),
            // IP and Port Editable Boxes
            _buildEditableBox('IP', ipController),
            const SizedBox(height: 10),
            _buildEditableBox('Port', portController),
            const SizedBox(height: 20),
            // Send Command Button
            ElevatedButton(
              onPressed: () {
                // Implement send command logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: const Text('Send Command'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommandButton(String title) {
    return ElevatedButton(
      onPressed: () => handleCommandTypeChange(title),
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedCommand == title ? Colors.orange : Colors.grey,
      ),
      child: Text(title),
    );
  }

  Widget _buildDropdown() {
    return DropdownButton<String>(
      value: selectedDropdownItem.isEmpty ? null : selectedDropdownItem,
      hint: const Text('Select Command'),
      items: currentCommands.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          selectedDropdownItem = newValue!;
        });
      },
    );
  }

  Widget _buildRelayButton(int index) {
    return ElevatedButton(
      onPressed: () => handleRelayToggle(index),
      style: ElevatedButton.styleFrom(
        backgroundColor: relayStates[index]! ? Colors.orange : Colors.grey,
      ),
      child: Text('Relay $index'),
    );
  }

  Widget _buildTextBox(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          readOnly: true,
        ),
      ],
    );
  }

  Widget _buildEditableBox(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
