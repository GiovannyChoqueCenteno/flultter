import 'package:flutter/material.dart';
import 'package:formularios/pages/home_screen.dart';
import 'package:formularios/pages/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: Colors.grey[300]),
        initialRoute: 'login',
        routes: {
          'home': (_) => HomeScreen(),
          'login': (_) => LoginScreen(),
        });
  }
}
