import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _estilo = TextStyle(fontSize: 25);

  int _contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Numero de clicks',
              style: _estilo,
            ),
            Text(
              '$_contador',
              style: _estilo,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _crearBotones(),
    );
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
            child: Icon(Icons.exposure_zero),
            onPressed: () {
              setState(() {
                _contador = 0;
              });
            }),
        Expanded(
          child: SizedBox(
            width: 0,
          ),
        ),
        FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                _contador--;
              });
            }),
        SizedBox(
          width: 5.0,
        ),
        FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                _contador++;
              });
            })
      ],
    );
  }
}
