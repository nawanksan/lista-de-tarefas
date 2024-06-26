import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: const Text(
                'Matéria: Programação para dispositivos Móveis \nProfessor: Marcel Moura\n =>Desenvolvedores:',
                style: TextStyle(fontSize: 20),
                
              ),
            ),
            Container(
              child: Image.asset(
                'assets/Kawan.png',
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Nome: Kawan Nascimento Santos',
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
            Container(
              child: Image.asset(
                'assets/brunoBinga.jpeg',
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    'Nome: Bruno Binga Castro',
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
