import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Mostrar Alerta'),
          onPressed: () => _mostrarAlert(context),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            shape: const StadiumBorder(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.logout), onPressed: () {}),
    );
  }

  _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('hla'),
                FlutterLogo(
                  size: 100.0,
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Ok'),
              )
            ],
          );
        });
  }
}
