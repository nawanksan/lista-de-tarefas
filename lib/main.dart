import 'package:flutter/material.dart';
import 'package:trabalhotarefas2/Perfil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Remove o banner de depuração
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> tasks = [
    "Task 1",
    "Task 2",
    "Task 3",
    "Task 4"
  ]; // Lista de tarefas
  List<bool> taskStatus = [
    false,
    false,
    false,
    false
  ]; // Lista de status das tarefas
  List<int> selectedIndexes = []; //todos os index das tarefas selecionadas

  void _removeTask(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Deletar',
              style: TextStyle(color: Colors.red),
            ),
            content: const Text('A Tarefa selecionada será EXCLUÍDA'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancelar"),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      tasks.removeAt(index);
                      taskStatus.removeAt(index);
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            // Text('Menu de Perfis'),
            const DrawerHeader(child: Text('Menu')),
            ListTile(
              title: const Text('Perfis'),
              onTap: () {
                //navegar para a outra página
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const Perfil();
                  }),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        // padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.blue.shade100,
              width: 400,
              child: const Text(
                'Home',
                style: TextStyle(fontSize: 40),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //Expanded serve para fazer seus filhos preencher o espaço disponivel
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(
                      value: taskStatus[index],
                      onChanged: (newValue) {
                        setState(() {
                          taskStatus[index] = newValue!;
                          // print(taskStatus);
                        });
                      },
                    ),
                    title: Text(tasks[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,color: Colors.red,),
                      onPressed: () {
                        _removeTask(index);
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, // Posicionamento do botão
    );
  }
}
