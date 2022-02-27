import 'package:flutter/material.dart';

class HomeTemp extends StatelessWidget {
  HomeTemp({Key? key}) : super(key: key);
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItemsCorta(),
      ),
    );
  }

  // List<Widget> _crearItems() {
  //   List<Widget> l = [];
  //   for (String item in opciones) {
  //     final tempWidget = ListTile(
  //       title: Text(item),
  //     );
  //     l
  //       ..add(tempWidget)
  //       ..add(const Divider());
  //   }
  //   return l;
  // }

  List<Widget> _crearItemsCorta() {
    return opciones
        .map((i) => ListTile(
              title: Text(i),
            ))
        .toList();
  }
}
