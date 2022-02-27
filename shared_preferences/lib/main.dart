import 'package:flutter/material.dart';
import 'package:shared_preference/pages/home_page.dart';
import 'package:shared_preference/pages/settings_page.dart';
import 'package:shared_preference/shared_prefs/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  @override
  final prefs = PreferenciasUsuario();
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferences',
      initialRoute: prefs.lastPath,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        SettingsPage.routeName: (context) => const SettingsPage()
      },
    );
  }
}
