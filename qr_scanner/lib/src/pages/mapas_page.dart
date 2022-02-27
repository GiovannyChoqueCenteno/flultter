import 'package:flutter/material.dart';
import 'package:qr_scanner/src/widgets/scan_tile.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'http');
  }
}
