import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Titulo'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 2,
        ),
        children: <Widget>[
          _crearInput(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return const TextField(
      textCapitalization: TextCapitalization.sentences,
      autofocus: true,
      decoration: InputDecoration(
        counter: Text('Letras 0'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
    );
  }
}
