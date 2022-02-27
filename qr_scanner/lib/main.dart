import 'package:flutter/material.dart';
import 'package:qr_scanner/src/pages/home_page.dart';
import 'package:qr_scanner/src/pages/mapa_page.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/src/providers/scan_provider.dart';
import 'package:qr_scanner/src/providers/ui_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UIProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScanProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR_Reader',
        initialRoute: 'home',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        routes: {
          'home': (_) => HomePage(),
          'mapa': (_) => MapaPage(),
        },
      ),
    );
  }
}
