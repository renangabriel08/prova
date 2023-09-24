import 'package:flutter/material.dart';
import 'package:flutter_application/pages/configuracoes.dart';
import 'package:flutter_application/pages/home.dart';
import 'package:flutter_application/pages/locais.dart';
import 'package:flutter_application/pages/mapa.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int paginaSelecionada = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('GoGo Trip')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (value) => setState(() {
          paginaSelecionada = value;
        }),
        currentIndex: paginaSelecionada,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Locais',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
      body: IndexedStack(
        index: paginaSelecionada,
        children: const [
          Home(),
          Locais(),
          Mapa(),
          Configuracoes(),
        ],
      ),
    );
    ;
  }
}
