import 'package:flutter/material.dart';
import 'package:qr_scanner/src/widgets/scan_tile.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'geo');
  }
}
