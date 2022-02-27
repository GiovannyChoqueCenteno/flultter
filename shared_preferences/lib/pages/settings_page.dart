import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preference/shared_prefs/preferencias_usuario.dart';
import 'package:shared_preference/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const String routeName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int? _genero = 1;
  String _nombre = 'Pedro';
  TextEditingController? _textEditingController;
  final prefs = PreferenciasUsuario();
  @override
  void initState() {
    super.initState();
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombre;
    _textEditingController = TextEditingController(text: _nombre);
  }

  void _setSelectedRadio(int? value) {
    if (value != null) {
      prefs.genero = value;
      _genero = value;
      setState(() {});
    }
  }

  void _setColorSecundario(bool value) {
    print(value);
    prefs.colorSecundario = value;
    _colorSecundario = value;
    setState(() {});
  }

  void _setNombre(String value) {
    prefs.nombre = value;
    _nombre = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: prefs.colorSecundario ? Colors.red : Colors.blue,
          title: Text('Ajustes'),
        ),
        drawer: MenuWidget(),
        body: Center(
            child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              onChanged: _setColorSecundario,
              title: Text('Color Secundario'),
            ),
            RadioListTile(
                value: 1,
                title: Text('Masculino'),
                groupValue: _genero,
                onChanged: _setSelectedRadio),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona usando el telefono'),
                onChanged: _setNombre,
              ),
            )
          ],
        )));
  }
}
