1) Nos trechos: 

 
  List<String> configurationCommands = ['Estado da Tela - Desligar a Tela 1', 'Estado da Tela - Desligar a Tela 1 e 2' , 'Estado da Tela - Ligar a Tela 1', 'Estado da Tela - Ligar a Tela 2', 'Estado da Tela - Ligar as Telas 1 e 2', '6', '7'];
  List<String> readCommands = ['8', '9', '10', '11', '12', '13', '14'];
  
  
  
	List<String>configurationCommands =['Estado da Tela - Desligar a Tela 1', 'Estado da Tela - Desliga
 
Substitua por:
  List<String> configurationCommands = ['1', '2', '3', '4', '5', '6', '7'];
  List<String> readCommands = ['8', '9', '10', '11', '12', '13', '14'];

children: <Widget>[
                _buildCommandButton('Configurations Commands'),
                const SizedBox(width: 10),
                _buildCommandButton('Read Commands'),
                const SizedBox(width: 10),
                _buildDropdown(),