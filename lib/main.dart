import 'package:flutter/material.dart';
import 'package:trabalhotarefas2/Perfil.dart';
import 'package:trabalhotarefas2/showDetalhes.dart';

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
  final TextEditingController _taskController = TextEditingController();
  List<String> tasks = [
    "Estudar Flutter",
    "Pesquisar Artigos para o TCC",
    "Fazer o Projeto Integrador",
    "Fazer a janta"
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
      },
    );
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
              alignment: Alignment.center,
              color: Colors.blue.shade100,
              width: 400,
              child: const Text(
                'Meu Dia',
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
                  return Card(
                    color: Colors.blue.shade100,
                    child: ListTile(
                      leading: Checkbox(
                        value: taskStatus[index],
                        onChanged: (newValue) {
                          setState(() {
                            taskStatus[index] = newValue!;
                            // print(taskStatus);
                          });
                        },
                      ),
                      title: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowDetalhes(
                                taskName: tasks[index],
                                taskStatus: taskStatus[index],
                              ),
                            ),
                          );
                        },
                        child: Text(tasks[index],style: TextStyle(color: taskStatus[index]? Colors.grey : Colors.black, decoration: taskStatus[index] ? TextDecoration.lineThrough : null,),),
                      ),

                      // title: Text(tasks[index]),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          _removeTask(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {

              return Container(
                height: 400,
                child: Column(
                  children: [
                    const Text(
                      "Adicionar Tarefas: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),

                    const SizedBox(height: 20.0),

                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Tarefa',
                        border: OutlineInputBorder(),
                      ),
                      controller: _taskController,
                    ),

                    const SizedBox(height: 20.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          
                          onPressed: () {
                            setState(() {
                              String newTask = _taskController.text;
                              if(newTask.length < 1) {
                                return;
                              } else {
                                tasks.add(newTask);
                                taskStatus.add(false);
                                _taskController.clear();
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(0, 36),
                            backgroundColor: Colors.green // Tamanho mínimo do botão (largura, altura)
                          ),
                          child: Container(
                            alignment: Alignment.center, // Alinhamento do texto dentro do botão
                            child: Text("Adicionar", style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.endFloat, // Posicionamento do botão
);}}