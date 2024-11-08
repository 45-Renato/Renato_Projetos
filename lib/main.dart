import 'package:flutter/material.dart';

void main() {
  runApp(ListaTarefa());
}

class ListaTarefa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LISTA DE TAREFAS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListaTarefaScreen(),
    );
  }
}

class ListaTarefaScreen extends StatefulWidget {
  @override
  _ListaTarefaScreenState createState() => _ListaTarefaScreenState();
}

class _ListaTarefaScreenState extends State<ListaTarefaScreen> {
  final List<String> _todosItens = [];

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  void _addTodoItem() {
    String nome = _nomeController.text;
    String data = _dataController.text;
    String telefone = _telefoneController.text;

    if (nome.isNotEmpty && data.isNotEmpty && telefone.isNotEmpty) {
      setState(() {
        _todosItens.add('Nome: $nome, Data: $data, Telefone: $telefone');
      });
      _nomeController.clear();
      _dataController.clear();
      _telefoneController.clear();
    }
  }

  void _removerTodoItem(int index) {
    setState(() {
      _todosItens.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('--- LISTA DE TAREFAS ---'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(226, 255, 2, 2),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print(" MENU ");
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildTextField(_nomeController, 'Escreva seu nome'),
                SizedBox(height: 8.0),
                _buildTextField(_dataController, 'Escreva a data'),
                SizedBox(height: 8.0),
                _buildTextField(_telefoneController, 'Escreva seu telefone'),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addTodoItem,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todosItens.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    title: Text(_todosItens[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removerTodoItem(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
