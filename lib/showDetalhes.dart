import 'package:flutter/material.dart';

class ShowDetalhes extends StatelessWidget {
  final String taskName;
  final bool taskStatus;

  const ShowDetalhes(
      {super.key, required this.taskName, required this.taskStatus});

  @override
  Widget build(BuildContext context) {
    String status;
    if (!taskStatus) {
      status = 'A fazer';
    } else {
      status = 'Concluída';
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da tarefa'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nome da Tarefa: $taskName',
              style: TextStyle(fontSize: 20),
            ),
            Text('Status da Tarefa: $status', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
