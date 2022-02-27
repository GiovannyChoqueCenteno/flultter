import 'package:flutter/material.dart';
import 'package:shared_preference/pages/home_page.dart';
import 'package:shared_preference/pages/settings_page.dart';
import 'package:shared_preference/shared_prefs/preferencias_usuario.dart';

class MenuWidget extends StatelessWidget {
  MenuWidget({Key? key}) : super(key: key);

  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/menu-img.jpg'),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue),
            title: Text('Pages'),
            onTap: () {
              String? actual = ModalRoute.of(context)?.settings.name;
              Navigator.pop(context);

              if (actual != HomePage.routeName) {
                Navigator.pushReplacementNamed(context, HomePage.routeName);
                prefs.lastPath = HomePage.routeName;
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue),
            title: Text('Party Mode'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('People'),
            onTap: () {
              String? actual = ModalRoute.of(context)?.settings.name;
              print(actual);
              Navigator.pop(context);

              if (actual != SettingsPage.routeName) {
                Navigator.pushReplacementNamed(context, SettingsPage.routeName);
                prefs.lastPath = HomePage.routeName;
              }
            },
          ),
        ],
      ),
    );
  }
}
