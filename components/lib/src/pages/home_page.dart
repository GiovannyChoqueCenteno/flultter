// ignore_for_file: avoid_print

import 'package:components/src/pages/alerta_page.dart';
import 'package:components/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    print('Aqui');
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: const [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          print('builder');
          print(snapshot.data);
          return ListView(
            children: _listaItems(snapshot.data ?? [], context),
          );
        });
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    for (var opcion in data) {
      final widgetTemp = ListTile(
        title: Text(opcion['texto']),
        leading: const Icon(Icons.access_alarm, color: Colors.blue),
        trailing: const Icon(Icons.keyboard, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, opcion['ruta']);
        },
      );
      opciones
        ..add(widgetTemp)
        ..add(const Divider());
    }
    return opciones;
  }
}
