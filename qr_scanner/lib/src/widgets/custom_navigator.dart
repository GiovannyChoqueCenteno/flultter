import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/src/providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    return BottomNavigationBar(
      onTap: (i) => uiProvider.selectedMenuOpt = i,
      currentIndex: uiProvider.selectedMenuOpt,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'Direcciones',
        ),
      ],
    );
  }
}
