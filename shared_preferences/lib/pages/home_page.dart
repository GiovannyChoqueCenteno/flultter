import 'package:flutter/material.dart';
import 'package:shared_preference/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
      ),
      drawer: MenuWidget(),
      body: Column(
        children: [
          Text('Color secundario'),
          Divider(),
          Text('Genero'),
          Divider(),
          Text('Nombre Usuario'),
          Divider(),
        ],
      ),
    );
  }
}
