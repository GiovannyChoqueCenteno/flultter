import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/src/providers/scan_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        const barcodenScanRes = 'http://fernando-herrera.com';
        final scanProvider = Provider.of<ScanProvider>(context, listen: false);
        scanProvider.nuevoScan(barcodenScanRes);
        scanProvider.nuevoScan('geo:15.33,15.66');
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}
